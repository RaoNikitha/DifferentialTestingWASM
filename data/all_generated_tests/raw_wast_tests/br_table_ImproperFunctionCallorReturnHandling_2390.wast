;; 10. Develop a `br_table` involving `call` instructions within the labels followed by forward and backward branches with `return` to test for any mismatches in context-based type checks and operand stacking during function calls and returns.

(assert_invalid
  (module
    (func $invalid-br_table-call-return
      (call $foo)
      (block (result i32)
        (block (result i32)
          (br_table 0 1 (i32.const 0))
        )
      )
      (i32.eqz) (drop)
    )
    (func $foo (result i32)
      (i32.const 42)
    )
  )
  "type mismatch"
)
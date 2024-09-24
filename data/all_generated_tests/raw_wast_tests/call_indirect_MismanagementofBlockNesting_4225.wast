;; 4. **Test Description**: Create a Wasm module with `call_indirect` inside a loop that then nests another loop, testing a `br_table` that jumps across the nested loops, verifying if the control flow exits correctly.

(assert_invalid
  (module
    (type (func))
    (table 1 funcref)
    (func $nested-loop-with-call-indirect (param i32) (result i32)
      (loop $outer
        (loop $inner
          (br_table $outer $inner (i32.const 0))
          (call_indirect (type 0) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)
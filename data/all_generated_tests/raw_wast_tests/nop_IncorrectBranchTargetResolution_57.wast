;; Test 8: Combine `nop` with a `br_table` in a complex function with multiple nested loops and blocks. Verify that the `br_table` resolves correctly to its designated labels and the function executes correctly.

(assert_invalid
  (module
    (func $complex (param i32) (result i32)
      (block $outer
        (block $inner
          (br_table $inner $outer 1 (nop))
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)
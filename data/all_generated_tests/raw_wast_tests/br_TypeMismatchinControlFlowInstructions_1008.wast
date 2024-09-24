;; 9. **Incorrect Operand Stack after Branch in Nested Loops:**    - Construct nested `loop` instructions where the outer loop requires an `i32` type, and the inner loop expects `i64`. Insert a `br` from the inner to the outer loop and test type consistency in operand stacks.

(assert_invalid
  (module
    (func $nested_loop_type_mismatch
      (loop (result i32)
        (i32.const 42)
        (loop
          (br 1)
          (i64.const 99)
        )
      )
    )
  )
  "type mismatch"
)
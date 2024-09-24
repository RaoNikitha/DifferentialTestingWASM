;; 5. **Test Five**:    - `br_table` within a `loop` where the default target is another `loop` block, and the index is just one more than the maximum index.    - **Constraint**: Ensures that the operand stack unwinding is correct even when transitioning between multiple loop blocks.    - **Relation**: Tests whether the transition to the default target loop correctly reinitializes the stack state.

(assert_invalid
  (module
    (func $test_five
      (loop $outer (result i32)
        (i32.const 3)
        (br_table 0 1)
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)
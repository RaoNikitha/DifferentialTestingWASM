;; 2. **Test Description**: Implement a loop with a counter and a `br_if` condition that exits the loop when the counter reaches a specific value. Verify the loop exits at the correct count.    - **Constraint**: Validate correct evaluation and branching based on the conditional counter.    - **Incorrect Condition Evaluation**: This test explores whether an incorrect condition evaluation leads to premature or delayed loop exits.

(assert_invalid
  (module 
    (func $test_counter_loop (result i32)
      (i32.const 0)
      (loop (result i32)
        (i32.const 1)
        (i32.add)
        (i32.const 5)
        (i32.gt_s)
        (br_if 0)
      )
    )
  )
  "type mismatch"
)
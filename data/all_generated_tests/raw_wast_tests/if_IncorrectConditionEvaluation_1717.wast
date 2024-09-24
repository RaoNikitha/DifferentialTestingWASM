;; 8. **Test Description**:    - **Test Name**: ConditionalLoopExit    - **Test Goal**: Validate that conditional branching within loops respects `if` conditions.    - **Specific Constraint**: Conditional `br_if` should only branch based on correct `if` condition.    - **Relation to Incorrect Condition Evaluation**: Tests if conditional evaluation within loops incorrectly affects loop control flow.

(assert_invalid
  (module
    (func $conditional-loop-exit
      (loop
        (i32.const 1)
        (if (result i32) (br_if 0 (i32.const 0)) (then (i32.const 1)) (else (i32.const 2)))
      )
    )
  )
  "type mismatch"
)
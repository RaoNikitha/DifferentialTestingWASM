;; 7. **Test Description**:    - **Test Name**: ImmediateElseExecution    - **Test Goal**: Evaluate if the `else` block immediately follows when the `if` condition is zero.    - **Specific Constraint**: `else` block execution with zero conditions.    - **Relation to Incorrect Condition Evaluation**: Ensure the `if` does not exec even with misinterpreted zero conditions.

(assert_invalid
  (module (func $immediate-else-execution (result i32)
    (i32.const 0)
    (if (result i32) 
      (i32.const 1)
      (then (i32.const 10))
      (else (i32.const 20))
    )
  ))
  "type mismatch"
)
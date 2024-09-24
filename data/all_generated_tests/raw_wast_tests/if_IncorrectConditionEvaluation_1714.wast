;; 5. **Test Description**:    - **Test Name**: NonZeroConditionEvaluation    - **Test Goal**: Confirm that conditions represented by non-zero values are correctly evaluated as true.    - **Specific Constraint**: Executes `then` block for any non-zero integer.    - **Relation to Incorrect Condition Evaluation**: Tests correctness of non-zero evaluation logic.

(assert_invalid
  (module (func $non_zero_condition_evaluation (result i32)
    (if (result i32) (i32.const 10) (then (i32.const 1)) (else (i32.const 0)))
  ))
  "expected i32 on stack"
)
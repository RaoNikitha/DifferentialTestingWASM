;; 4. **Test Description**:    - **Test Name**: ZeroBranchesIncorrectly    - **Test Goal**: Ensure that an `if` with a false evaluation does not execute the `then` block.    - **Specific Constraint**: Validation that zero condition should jump to `else` or `end`.    - **Relation to Incorrect Condition Evaluation**: Checks if `0` is improperly causing a branch into `then`.

(assert_invalid
  (module (func $ZeroBranchesIncorrectly
    (if (result i32) (i32.const 0) (then (i32.const 42)) (else (i32.const 43)))
  ))
  "type mismatch"
)
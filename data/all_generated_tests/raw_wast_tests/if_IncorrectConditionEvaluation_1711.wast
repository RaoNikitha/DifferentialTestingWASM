;; 2. **Test Description**:    - **Test Name**: IncorrectTrueBranch    - **Test Goal**: Validate that the `then` block of an `if` executes correctly when the condition is true.    - **Specific Constraint**: The `then` block should only execute when the condition is non-zero.    - **Relation to Incorrect Condition Evaluation**: Ensures that the `then` branch is not mistakenly skipped.

(assert_invalid
  (module (func $incorrect-true-branch
    (if (i32.const 1) (then (i32.add (i32.const 1) (i32.const 2)) (drop)))
  ))
  "type mismatch"
)
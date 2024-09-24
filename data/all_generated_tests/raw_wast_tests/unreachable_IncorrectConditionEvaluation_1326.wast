;; 7. **Test Description:**    - Implement an `if-else` structure where `unreachable` is in the `else` clause, based on a condition that evaluates to true. Verify proper execution without unintended traps.    - Constraint: Tests the alternate path and correct branching to avoid `unreachable`.    - Relation to Incorrect Condition Evaluation: Ensures the correct branch is executed against misinterpreted conditions.

(assert_invalid
  (module (func
    (if (i32.const 1) (then) (else (unreachable)))
  ))
  "missing both blocks"
)
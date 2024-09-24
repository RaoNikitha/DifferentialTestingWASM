;; 5. **Unreachable Within Loop Reinitialization**:    - Test a loop where reinitialization mistakenly leads to hitting an `unreachable` instruction meant to be skipped by valid paths.    - **Constraint**: Validates loop reinitialization and side effect handling.    - **Relation to Unreachable Code Execution**: Ensures reinitialization does not erroneously trigger `unreachable`.

(assert_invalid
  (module
    (func
      (loop (result i32)
        (br 1)
        (unreachable)
      )
    )
  )
  "type mismatch"
)
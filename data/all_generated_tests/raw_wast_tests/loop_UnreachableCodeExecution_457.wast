;; 8. **Loop with Incorrect Branch Target**:    - Implement a loop where a branch explicitly targets an incorrect `unreachable` label that should only be hit under faulty conditions.    - **Constraint**: Ensures proper label handling and branch target correctness.    - **Unreachable Code Execution**: Confirms that label mismanagement does not result in executing `unreachable`.

(assert_invalid
  (module
    (func
      (loop
        (block (br 2))
      )
    )
  )
  "unknown label"
)
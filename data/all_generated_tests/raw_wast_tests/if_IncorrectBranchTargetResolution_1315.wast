;; 6. **Test: Forward Branch Targeting Non-Existent Label**:    - **Description**: Write an `if-else` block followed by a `br` in the `then` block that targets label `2` assuming multiple nested levels which do not exist.    - **Constraint**: Ensures branches are properly checked against the available scope.    - **Relation to Branch Target Resolution**: Assesses if the implementation correctly validates label availability outside available blocks.

(assert_invalid
  (module
    (func $forward-branch-targeting-non-existent-label
      (i32.const 1)
      (if (result i32)
        (then (br 2))
        (else (i32.const 0))
      )
    )
  )
  "unknown label"
)
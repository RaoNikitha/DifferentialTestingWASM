;; 8. **Test 8: Nested Block with Invalid Branch and Unreachable**    - Create deeply nested blocks where an inner `br` tries to target an invalid label from a different block and follow the blocks with an `unreachable`.    - Tests for correct error handling in branching, verifying if execution unintentionally reaches the `unreachable`.

(assert_invalid
  (module
    (func
      (block
        (block
          (br 2)
        )
        (unreachable)
      )
    )
  )
  "unknown label"
)
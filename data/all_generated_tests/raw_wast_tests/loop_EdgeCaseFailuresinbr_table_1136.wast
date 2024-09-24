;; 7. **Test Case 7**: A `br_table` with different block types (e.g., different expected stack signatures) within a loop.    - **Constraint**: Ensuring type consistency and correct target execution.    - **Relation to br_table Edge Case**: Tests proper type resolution and target jump handling.

(assert_invalid
  (module
    (func $test-case-7
      (loop (result i32)
        (block (loop (result f64)
          (br_table 0 1)
        ))
      )
    )
  )
  "type mismatch"
)
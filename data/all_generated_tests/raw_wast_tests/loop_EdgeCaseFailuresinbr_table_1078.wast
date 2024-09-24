;; 9. **Complex Nested `br_table`**:    - **Description**: Test a `br_table` inside a complex structure of nested loops with nested targets.    - **Constraint**: Verifies correct behavior of indirect branches within deeply nested contexts.

(assert_invalid
  (module
    (func $complex-nested-br_table
      (block
        (loop
          (block
            (loop
              (block
                (br_table 0 1 2)
                (br 3)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
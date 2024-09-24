;; 8. **Test with Nested `br_table` Instructions**:    - **Description**: Create nested `br_table` instructions with various indices, where the outer block finishes with a `return`. Checks if nested branching handles stack unwinding correctly.    - **Relation to Edge Case**: Ensures proper handling of nested `br_table` scenarios and that `return` instructions unwind as expected.

(assert_invalid
  (module
    (func $nested-br_table-with-return (result i32)
      (block $outer
        (block $inner
          (br_table 0 0 (i32.const 1) (return))
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)
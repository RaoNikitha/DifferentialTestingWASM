;; 4. **Test Description**:    - Create a `loop` with a `br_table` holding several target indices, using an index that is far beyond the count of available labels.    - **Constraint**: Verifies systems' resilience to significantly out-of-bounds indices.    - **Edge Case**: Evaluates error handling for extreme indexing errors.

(assert_invalid
  (module
    (func $large-index-br-table
      (block
        (block
          (br_table 0 0 0 0 0 0 0 2147483647)
        )
      )
    )
  )
  "index out of bounds"
)
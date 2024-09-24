;; 5. **`br_table` with Sparse Targets**:    - **Description**: Use a `br_table` inside a loop with large gaps between valid indices and a provided index operand that falls into a gap.    - **Constraint**: Verifies implementation correctly falls back to the default when the sparse gaps are encountered.

(assert_invalid
  (module
    (func $br_table_sparse_targets
      (block $outer
        (loop $inner (br_table $outer $inner (i32.const 10)))
      )
    )
  )
  "invalid br_table targeting"
)
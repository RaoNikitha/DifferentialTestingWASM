;; 5. **Test Case 5**: A `loop` block that includes a `br_table` with mixed valid and invalid indices.    - **Constraint**: Ensuring robust handling of both in-bounds and out-of-bounds branches within the same `loop`.    - **Relation to br_table Edge Case**: Check for differential behavior in mixed-index scenarios.

(assert_invalid
  (module (func $test_br_table_mixed_indices
    (block $label (loop $loop (block
      (block (block (block (br_table $label $loop $label $loop $label (i32.const 5))))
    )))))
  )
  "out of range label index"
)
;; 3. **Test with Sparse Target List**:    - **Description**: Implement a `br_table` instruction with non-continuous indices and a sparse list of target labels. If the index jumps over the gaps, the implementations must handle this correctly.    - **Relation to Edge Case**: Checks if both implementations can handle gaps in label indices without causing unwinding issues or crashes.

(assert_invalid
  (module
    (func $sparse-target-list
      (block $label0
        (block $label1
          (block $label2
            (br_table $label0 $label2 (i32.const 1))
            (return)
          )
        )
      )
    )
  )
  "type mismatch"
)
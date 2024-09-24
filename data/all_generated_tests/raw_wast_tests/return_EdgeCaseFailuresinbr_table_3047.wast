;; 6. **Test with Repeated Index Values**:    - **Description**: Implement a `br_table` with repeated index values leading to the same label. This tests if the return instruction works correctly when indices are reused.    - **Relation to Edge Case**: Checks consistency and correct unwinding behavior when duplicate indices are encountered.

(assert_invalid
  (module
    (func $repeated-index-values-br_table (result i32)
      (block $exit
        (block $label1
          (block $label2
            (br_table $label1 $label1 (i32.const 0))
            (return)
          )
        )
      )
    )
  )
  "type mismatch"
)
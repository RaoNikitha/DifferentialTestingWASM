;; 8. **Exceeding Label Vector Size**:    Test with an operand significantly larger than the label vector size to see if the implementation consistently chooses the default label for large out-of-bounds values.

(assert_invalid
  (module
    (func (param i32)
      (block
        (br_table 0 0 10000 (local.get 0))
      )
    )
  )
  "unknown label"
)
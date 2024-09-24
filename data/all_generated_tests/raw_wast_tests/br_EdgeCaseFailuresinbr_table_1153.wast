;; 4. **Test Description**: A `br_table` with a very large index value, significantly out of bounds.    - **Constraint Checked**: Behavior when the index value is far beyond the number of available target labels.    - **Edge Case Relation**: Ensures robust handling of extreme out-of-bounds values without causing undefined behavior.

(assert_invalid
  (module (func (block (block (br_table 0 0 0 0 0 999999 (i32.const 6)))))
  )
  "unknown label"
)
;; 3. **Test with Out-of-Bounds Index in `br_table`**:    - **Description**: Utilize a `br_table` with an index that exceeds the number of available targets to ensure proper trap handling.    - **Constraint Checked**: Index bounds check within `br_table`.    - **Edge Case Relation**: Ensures that out-of-bounds indices trigger a correct trap without corrupting the stack.

(assert_invalid
  (module
    (type (func (param i32)))
    (func $test (param i32)
      (block
        (loop
          (br_table 0 1 (local.get 0))
        )
      )
    )
  )
  "index out of bounds"
)
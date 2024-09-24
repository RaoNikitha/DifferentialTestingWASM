;; 6. **Test Description**: Test a `block` encapsulating a `br_table` that includes an index exactly matching the number of labels. Implementations should confirm if such index values are treated as out-of-bounds cases.    - **Constraint Checked**: Strict indexing enforcement ensuring indices strictly lesser than label count.

(assert_invalid
  (module (func (block (result i32) (i32.const 0) (br_table 1 (i32.const 0))))
  )
  "br_table index out of bounds"
)
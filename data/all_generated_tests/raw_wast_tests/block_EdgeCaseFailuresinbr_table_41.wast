;; 2. **Test Description**: Construct a `br_table` within a `block` where the jump indices indirectly target an outer label (outside the block's context). This will check if implementations enforce correct scoping rules for `br_table` indices.    - **Constraint Checked**: Proper scoping and resolution of label indices within nested blocks.

(assert_invalid
  (module
    (func (block
      (block (block
        (br_table 1 0 (i32.const 0))
      ))
    ))
  )
  "label index out of range"
)
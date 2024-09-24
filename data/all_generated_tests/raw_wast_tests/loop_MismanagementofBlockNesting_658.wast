;; 9. **Test Description**: A single `loop` within a nested block structure, followed by multiple `br_table` targeting different nesting levels.    - **Constraint Checked**: Verification of handling indirect branches in nested block-loop structures.    - **Relation to Mismanagement of Block Nesting**: Errors in understanding correct label and target address within nested structures.

(assert_invalid
  (module
    (func (block (loop (block (br_table 0 1 2)))))
  )
  "type mismatch"
)
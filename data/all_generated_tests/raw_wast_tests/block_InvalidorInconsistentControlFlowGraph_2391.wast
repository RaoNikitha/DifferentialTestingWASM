;; 2. **Test a block with an invalid `br_table` where one of the indices does not exist**:    - **Constraint Checked**: Verifies whether label indices are appropriately computed and out of bound indices are caught.    - **Reasoning**: Misinterpreted tables can produce an inconsistent control flow graph by branching to non-existent labels.

(assert_invalid
  (module (func $invalid-br_table
    (block (br_table 0 1 2 (i32.const 0)))
  ))
  "unknown label"
)
;; 5. **Test for Stacked Nested Blocks:**    - **Description:** Define multiple nested blocks containing `br_table` with labels that are ambiguous. For each nested block's `br_table`, ensure labels should resolve in the correct context but can cause CFG inconsistencies.    - **Constraint Checked:** Proper handling of label indexing relative to the current block’s nesting depth within the CFG.

(assert_invalid
  (module (func $stacked-nested-blocks
    (block
      (block
        (block
          (br_table 1 2 (i32.const 0))
        )
        (br_table 0 2 (i32.const 1))
      )
      (br_table 0 3 (i32.const 2))
    )
  ))
  "unknown label"
)
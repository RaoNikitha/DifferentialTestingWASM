;; 7. **Test Description**: Test a `block` wherein a branch table (`br_table`) targets different blocks based on varying stack conditions, ensuring the stack matches branch targets.    - **Constraint Checked**: Ensures correct stack handling and alignment when performing multiple branch targets in a block.    - **Relation to Stack Corruption**: Mismatched stack conditions and target branches can lead to incorrect stack heights, causing stack corruption across branch execution paths.

(assert_invalid
  (module (func $block-br_table-stack-mismatch
    (block (result i32)
      (block (result i32)
        (br_table 0 1 (i32.const 1))
      )
      (i32.const 2)
      (br_table 0 2)
    )
  ))
  "type mismatch"
)
;; 8. **Test `br_table` in Empty Block**:    - A `br_table` inside an empty block with non-zero indices.    - *Constraint*: Checks behavior of branch tables within empty blocks with no instructions.    - *Relation*: Verifies if label stack handling is correct even when there are no other instructions in the block.

(assert_invalid
  (module (func $br_table-empty-block
    (block (result i32)
      (br_table 0 1 (i32.const 42))
    )
  ))
  "expected end"
)
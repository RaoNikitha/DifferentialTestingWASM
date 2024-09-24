;; 3. **Test Description**: Develop a block that includes a `br_table` instruction with jump targets outside the block scope.    - **Constraint**: Validate that branch table targets are within the range of defined labels.    - **CFG Relation**: Ensures the CFG properly constrains branch targets within valid scope ranges.

(assert_invalid
  (module (func $br_table-outside-block
    (block 
      (br_table 1 1 (i32.const 0))
    )
  ))
  "br_table targets out of range"
)
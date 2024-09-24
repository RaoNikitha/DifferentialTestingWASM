;; 2. **Test with Empty Label Table**:    - Construct a block containing a `br_table` instruction with an empty label table and a default target. Ensure that the block is well-nested and check if the `br_table` can correctly branch to the default target.    - **Constraint Checked**: Handling of `br_table` with an empty label table.

(assert_invalid
  (module (func $empty-br-table
    (block (result i32)
      (br_table 0 (f32.const 1.0)) (br_table 0))
  ))
  "type mismatch"
)
;; 3. **Test with All Indices Targeting Default**:    - Use a block where the `br_table` instruction has multiple indices, all targeting the default label. This checks whether the engine correctly redirects all branches to the provided default.    - **Constraint Checked**: Correct redirection to the default target when all indices use it.

(assert_invalid
  (module (func $br_table-all-defaults
    (block (block 
      (br_table 0 0 0 (block (result i32) (i32.const 0)))
    ))
  ))
  "type mismatch"
)
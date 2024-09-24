;; 3. **Test Description:** Use the `br_table` instruction with forward branches and validate that the operand types produced by the terminated block match the target block's expectations.    - **Constraint Checked:** Ensures operand type consistency between the source and target blocks in forward branches.    - **Relation to Incorrect Branch Target Resolution:** Mismatched operand types might lead to resolving a branch incorrectly.

(assert_invalid
  (module (func $forward-branch-type-mismatch (result i32)
    (block (result i32) (block (result i64)
      (i64.const 0)
      (br_table 0 (i32.const 0))
    ))
    (i32.const 1)
  ))
  "type mismatch"
)
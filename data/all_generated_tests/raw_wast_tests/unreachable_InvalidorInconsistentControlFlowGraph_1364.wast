;; 5. **Test Case: Unreachable in Br Table Instruction**    - Description: Use the `br_table` instruction to branch to a sequence ending with `unreachable`, and check if the selected branch traps as expected.    - CFG Constraint: The test assesses the control flow determination in `br_table` when an unreachable branch index is selected, ensuring trapping behavior.

(assert_invalid
  (module (func $type-br_table-unreachable
    (block (result i32)
      (block (br_table 0 (i32.const 0) (i32.const 0)))
      (unreachable)
    )
  ))
  "type mismatch"
)
;; 2. **Test Description: Mismatched Operand Types on Return:**    - Design a sequence where a `br_table` instruction branches to a return type mismatch situation in a nested block.    - **Constraint Checked:** Validates that the return types from the branches match expected function return types.    - **Relation to Incorrect Return Values:** Confirms the handling of operand type consistency when returning from nested control structures.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br_table 0 1 2 (i32.const 1) (i64.const 2)) (i32.const 1)
          )
        )
      )
    )
  )
  "type mismatch"
)
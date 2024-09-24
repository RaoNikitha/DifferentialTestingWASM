;; 2. **Test for Mismatched Operand Types in Forward Branch:**    - **Description:** Create a `br_table` instruction within a block whose target labels have forwarding branches with mismatched operand types. Ensure the operand type sequence expected by each label does not align with the operand stack configuration.    - **Constraint Checked:** Operand type matching for forward branches; CFG should correctly interpret stack states and operand types.

(assert_invalid
  (module
    (func $mismatched-operand-types
      (block (result i32)
        (block (result f32)
          (br_table 0 1 (i32.const 0))
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)
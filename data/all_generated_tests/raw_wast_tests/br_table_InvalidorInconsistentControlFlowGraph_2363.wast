;; 3. **Test with Backward Loop Mismatched Operand Types:**    - **Description:** Construct a loop where a `br_table` instruction attempts to branch backward into a loop block with mismatched operand types.     - **Constraint Checked:** Validating that backward branches properly match the operand types the loop expects, ensuring the CFG accurately models operand consumption and re-entry.

(assert_invalid
  (module (func $loop-operand-type-mismatch
    (loop (result i32)
      (br_table 0 0 (i32.const 1) (i64.const 1))
    )
  ))
  "type mismatch"
)
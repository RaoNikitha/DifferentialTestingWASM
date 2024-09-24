;; 3. **Test: BrTable with Operand Index Out-of-Bounds, Default Label Type Mismatch**    - **Description**:      A `br_table` instruction where the operand index is out-of-bounds, defaulting to a label that expects an `i64` operand, but an `i32` is on the stack.    - **Constraint Checked**:      Tests the type matching for the default label when the operand index is out of bounds.    - **Related Type Mismatch**:      Default label handling with type mismatch.

(assert_invalid
  (module
    (func
      (block (block (block (br_table 0 1 (i32.const 2)) (i64.const 3))))
    )
  )
  "type mismatch"
)
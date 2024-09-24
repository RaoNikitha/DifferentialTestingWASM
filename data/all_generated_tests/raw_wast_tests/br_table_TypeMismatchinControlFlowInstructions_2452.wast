;; 2. **Test: BrTable with Multiple Labels, Mismatched Operand Types**    - **Description**:      A `br_table` instruction with multiple labels where each label expects an `f32` operand, but the instruction has an `i32` on the stack.    - **Constraint Checked**:      Verifies the handling of mismatched operand types across multiple labels.    - **Related Type Mismatch**:      Multiple forward branches with incorrect operand types.

(assert_invalid
  (module (func $br_table_multi_labels_mismatched_operands
    (block $label0 (result f32)
      (block $label1 (result f32)
        (block $label2 (result f32)
          (i32.const 0)
          (br_table $label0 $label1 $label2 (i32.const 1)))))
  ))
  "type mismatch"
)
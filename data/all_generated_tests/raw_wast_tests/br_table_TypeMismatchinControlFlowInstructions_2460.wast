;; 10. **Test: Out-of-Bound Operand, Default Label with Wrong Type**     - **Description**:       A `br_table` with an operand causing an out-of-bounds branch and the default label expecting `f64` while the stack has `i64`.     - **Constraint Checked**:       Investigates default label type validations for out-of-bounds operand cases.     - **Related Type Mismatch**:       Out-of-bound branch default type mismatch handling.

(assert_invalid
  (module (func $out_of_bound_default_label_wrong_type
    (block (result f64)
      (br_table 0 1 (i32.const 5) (i64.const 10))
    )
  ))
  "type mismatch"
)
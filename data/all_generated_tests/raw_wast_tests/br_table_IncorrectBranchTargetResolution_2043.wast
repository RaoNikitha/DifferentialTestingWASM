;; 3. **Only Default Label with Invalid Operand:**    Include only the default label and provide an invalid operand.    - **Test Constraint:** The `br_table` must handle invalid operands by jumping to the default label.    - **Expected Differential:** WebAssembly should jump to the default label while wizard_engine might fail to handle the operand appropriately.

(assert_invalid
  (module (func $only-default-label-with-invalid-operand
    (block (br_table 0 (i32.const -1)))
  ))
  "unknown label"
)
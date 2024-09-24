;; 1. **Out-of-Bounds Index Without Default:**    Ensure that the operand index is greater than the length of the label vector, but no default label is specified.    - **Test Constraint:** The `br_table` must correctly handle out-of-bounds indices by jumping to a default label.    - **Expected Differential:** WebAssembly should trap, while wizard_engine might behave unexpectedly.

(assert_invalid
  (module (func $out-of-bounds-no-default
    (block (br_table 0 1 2 (i32.const 3)))
  ))
  "br_table index out of bounds with no default"
)
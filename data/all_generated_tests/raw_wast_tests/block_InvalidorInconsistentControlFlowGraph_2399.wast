;; 10. **Test blocks with mixed valid and invalid instructions forming inconsistent and unreachable operand manipulations**:    - **Constraint Checked**: Validates correctness of operand stack state transitions in complex block instructions.    - **Reasoning**: Mixed operand manipulations causing CFG to miss expected paths and create unreachable code would highlight inconsistencies.

(assert_invalid
  (module (func $block-mixed-valid-invalid (result i32)
    (i32.add (block (result i32)
      (drop (i32.const 10))
      (drop (i64.const 20))
      (br 0 (i64.const 30))
      (br 0 (i32.const 40))
    ))
  ))
  "type mismatch"
)
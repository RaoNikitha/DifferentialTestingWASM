;; 8. **Block with Mixed Value Types and Branching**:    - Create a block with mixed value types on the operand stack before a forward branching instruction.    - Check for stack corruption by observing how each implementation handles mixed type values during branching.

(assert_invalid
  (module (func $block-mixed-value-types-branch (result i32)
    (i32.const 42)
    (f64.const 3.14)
    (block (result i32) (br 0 (i32.const 1)))
  ))
  "type mismatch"
)
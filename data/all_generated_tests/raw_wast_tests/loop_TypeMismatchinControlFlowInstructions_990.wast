;; 1. **Mismatched Operand Stack Type Within Loop Body**:    - A loop instruction with a body that starts by pushing an integer but ends expecting a floating-point value.    - This tests whether the operand stack type mismatches are correctly detected when branches target the loop start.    - Specific Constraint: Ensures proper type checking of the operand stack within the loop body.

(assert_invalid
  (module (func
    (loop 
      (i32.const 10)
      (f32.const 0.5)
      (br 0)
    )
  ))
  "type mismatch"
)
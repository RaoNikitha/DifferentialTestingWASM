;; 9. **Test Description**:    Use a block where an instruction causes the operand stack to have excess elements than expected by the block type, and ensure that this leads to a type error.    **Constraint:** Validating operand stack size consistency.    **Relation to Type Mismatch:** Prevents over-stacking that violates type constraints.

(assert_invalid
  (module (func $excess-operand-stack (result i32)
    (block (result i32) (i32.const 5) (i32.const 10) (i32.add))
  ))
  "type mismatch"
)
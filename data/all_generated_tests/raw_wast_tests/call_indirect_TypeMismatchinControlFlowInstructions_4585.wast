;; 4. **Incorrect Operand Stack Handling**:    - Test `call_indirect` where the expected function signature requires three operands, but only two are on the stack.    - **Constraint**: Proper handling of the operand stack, ensuring necessary operands are available.    - **Relation**: Detects whether operand stack underflow triggers correctly, ensuring type constraints are followed in control flow.

(assert_invalid
  (module
    (type (func (param i32 i32 i32)))
    (table 1 funcref)
    (elem (i32.const 0) funcref (ref.func 0))
    (func (type 0) (param i32 i32 i32) (result i32)
      (local.get 0)
    )
    (func $stack-underflow (param i32 i32)
      (call_indirect (type 0) (local.get 0) (local.get 1) (i32.const 0))
    )
  )
  "type mismatch"
)
;; 10. **Test Description**:    - Test the `call_indirect` during an early return from a block where the provided operands fail type conformity with the expected function parameters, ensuring that the function type enforced correctly leads to trapping.    - **Constraint Being Checked**:      - Proper handling of operand types for early returns within control-flow blocks.    - **Relation to Control Flow Instructions**:      - Ensures that early returns do not bypass the type conformity enforcement within blocks.

(assert_invalid
  (module
    (type (func (param i32 f64)))
    (table 1 funcref)
    (func $block-early-return
      block
        (i32.const 0)
        br 0
        (call_indirect (type 0) (i32.const 1) (i32.const 0))
      end
    )
  )
  "type mismatch early return"
)
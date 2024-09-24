;; 4. **Correct Operand Exhaustion**:    Create a scenario where the operand stack does not provide enough arguments for the `call_indirect` function signature, resulting in a trap. This tests that operand stack underflow is detected and handled correctly in both implementations.      **Constraint**: Check for proper operand stack management against function signatures.

(assert_invalid
  (module
    (type (func (param i32 i32)))
    (table 1 funcref)
    (func $operand-exhaustion-test
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)
;; 10. **Mismatched Return Type Test**:     - **Description**: Call a function indirectly where the return type does not match the expected return type, resulting in a type mismatch trap.     - **Constraint**: Check conformity in return type consistency.     - **Unreachable Code**: This discrepancy will lead to a trap, thus avoiding unintended 'unreachable' execution.

(assert_invalid
  (module
    (type (func (result f32)))
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func (result i32)
      (i32.const 1)
    )
    (func $test
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)
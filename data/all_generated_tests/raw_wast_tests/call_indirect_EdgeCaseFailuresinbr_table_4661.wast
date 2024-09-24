;; 10. **Large Operand Values**:    - Test a `call_indirect` with very large operand values to ensure they are managed without overflow issues and correct function resolution.    - This verifies that both bounds and value ranges are handled accurately without unintended behavior.    - It relates to `br_table` to ensure robust handling of large values and operand integrity.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (table 1 funcref)
    (func (param i32)
      (call_indirect (type $sig) (i32.const 0xFFFFFFFF))
    )
  )
  "index out of bounds"
)
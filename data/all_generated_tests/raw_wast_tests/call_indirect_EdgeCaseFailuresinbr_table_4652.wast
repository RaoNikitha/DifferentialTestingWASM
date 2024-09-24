;; 1. **Mismatched Operand Types**:    - Test a `call_indirect` instruction where the operand stack contains mismatched types (e.g., providing a floating-point value where an integer is expected).    - This test specifically checks if both implementations correctly trap due to invalid operand types.    - It relates to `br_table` by ensuring the stack handling and type correctness extend to dynamic function call operations.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 funcref)
    (func $mismatch-operands
      (call_indirect (type 0) (i32.const 1) (f32.const 0.0))
    )
  )
  "type mismatch"
)
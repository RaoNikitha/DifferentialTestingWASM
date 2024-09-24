;; 6. Test a scenario where the `call_indirect` instruction expects an `i32` value on the stack, but the operand stack is manipulated to provide an incorrect type (e.g., `i64`), to check if type validation for stack operands is handled properly.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func (result i32)
      (i64.const 1)
      (call_indirect (type 0) (i64.const 1))
    )
  )
  "type mismatch"
)
;; 5. Generate a test where the operand stack is deliberately left with incorrect or insufficient parameters before invoking `call_indirect`, ensuring the implementation properly handles stack underflow errors.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32))
    (func $insufficient-params
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)
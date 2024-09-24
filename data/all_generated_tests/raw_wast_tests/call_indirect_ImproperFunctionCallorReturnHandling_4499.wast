;; 8. Test a specific case where a `call_indirect` instruction attempts to pop more arguments from the operand stack than available, to verify if both implementations detect and handle stack underflow conditions correctly.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (table funcref)
    (func
      (call_indirect (type $sig) (i32.const 0) (i32.const 1))
    )
  )
  "stack underflow"
)
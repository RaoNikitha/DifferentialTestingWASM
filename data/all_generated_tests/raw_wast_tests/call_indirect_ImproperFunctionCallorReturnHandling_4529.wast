;; 8. **Parameter Stack Underflow**: Implement a test where the `call_indirect` does not have sufficient arguments on the stack before the call. This should trap due to operand stack underflow.

(assert_invalid
  (module
    (type (func (param i32 i32)))
    (table 0 funcref)
    (func $insufficient-args (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)
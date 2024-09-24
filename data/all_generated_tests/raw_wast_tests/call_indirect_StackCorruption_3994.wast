;; 3. **Insufficient Argument Handling**:    - Execute a `call_indirect` where the function in the table expects more arguments than what is provided by the caller. This should lead to a stack underflow or incorrect function invocation.

(assert_invalid
  (module
    (type (func (param i32 i32 i32)))
    (table funcref (elem))
    (func $insufficient-args
      (call_indirect (type 0) (i32.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)
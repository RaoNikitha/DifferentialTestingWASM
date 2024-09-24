;; 3. **Test 3: Excessive Stack Operands**:    Place more operands on the stack than required by the callee function signature and use `call_indirect`. Monitor how the additional stack operands are treated post invocation, ensuring no stack corruption.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) func)
    (func (result i32)
      (i32.const 0)
      (call_indirect (type 0) (i32.const 999) (i32.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)
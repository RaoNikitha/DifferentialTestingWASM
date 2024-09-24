;; 7. **Interleaved Function Calls with Operand Stack Variations**:    - Implement `call_indirect` with interleaved calls to different types of functions, alternating between operand stack overflows/underflows.    - Ensure CFG can adapt to these dynamic changes and properly manage the operand stack so that no operand mix-ups occur during execution.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i64)))
    (table 2 funcref)
    (func (param i32) (result i32)
      (i32.const 0)
      (call_indirect (type 0) (i32.const 0))
    )
    (func (result i64)
      (i32.const 1)
      (call_indirect (type 1) (i32.const 1))
    )
    (elem (i32.const 0) 0 1)
  )
  "type mismatch"
)
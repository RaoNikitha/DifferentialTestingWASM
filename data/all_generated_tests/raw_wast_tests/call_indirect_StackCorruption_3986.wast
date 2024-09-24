;; 5. **Excess Operand Stack Values**:     Structure a function call with more parameters on the operand stack than required. Post `call_indirect`, ensure stack cleanup is correctly handled and no extraneous values remain, checking for stack integrity.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) $dummy)
    (func $dummy (param i32))
    (func $excess-stack-values
      (call_indirect (type 0) (i32.const 1) (i32.const 0) (i32.const 42))
    )
  )
  "type mismatch"
)
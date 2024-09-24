;; 2. **Test Mismatched Function Type with Adequate Operand Stack**:    - Use a `call_indirect` instruction with the correct table index but a mismatched function type signature.    - Checks for: Ensuring implementations trap when dynamic type checking fails and operand stack is properly consumed.

(assert_invalid
  (module
    (type $sig1 (func (param i32)))
    (type $sig2 (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32) (result i32) (i32.const 42))
    (func (param i32)
      (call_indirect (type $sig1) (local.get 0) (i32.const 0))
    )
  )
  "type mismatch"
)
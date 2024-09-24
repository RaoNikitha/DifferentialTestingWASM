;; 8. **Test 8: Operand Type Overflow**:    Add redundant operands to the stack before performing `call_indirect`. The operand overflow should be handled without corrupting the stack and trapping if there's a mismatch post-call.

(assert_invalid
  (module
    (func $f (param i32))
    (type $sig (func (param i32)))
    (table funcref (elem $f))
    (func $operand-type-overflow
      (i32.const 0) (i32.const 0) (i32.const 0)
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)
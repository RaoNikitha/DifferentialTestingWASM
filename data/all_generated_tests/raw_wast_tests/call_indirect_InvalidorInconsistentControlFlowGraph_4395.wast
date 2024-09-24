;; Test 4: Mismatched Operand Types - **Constraint/Issue**: Tests handling of improper function signature types. - **Test Description**: Push operands to the stack that do not match the parameter types expected by the function referenced in the table. Execute `call_indirect` and check for a trap resulting from the type mismatch.

(assert_invalid
  (module
    (type $sig (func (param i64) (result i32)))
    (func $f (param i64) (result i32) (i32.const 42))
    (table funcref (elem $f))
    (func
      (call_indirect (type $sig) (i32.const 0) (nop))
    )
  )
  "type mismatch"
)
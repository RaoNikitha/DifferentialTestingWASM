;; 10. **Test Description**: Construct a case with polymorphic functions and use `call_indirect` to call these functions with varying operand types, ensuring some do not conform to expected types.    **Constraint Checked**: Verifies handling of polymorphic function types.    **Relation to Improper Handling**: Ensures consistent type-checking for polymorphic functions, preventing incorrect function call handling.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i64) (result i32)))
    (func $f1 (type $sig1) (param i32) (result i32) (local.get 0))
    (func $f2 (type $sig2) (param i64) (result i32) (i32.const 0))
    (table funcref (elem $f1 $f2))
    (func $type-mismatch-in-call
      (call_indirect (type $sig1) (i32.const 1) (i32.const 42))
    )
  )
  "type mismatch"
)
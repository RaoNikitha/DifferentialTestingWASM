;; 10. **Invalid Indirect Call in Function with Different Return Type**:     - Create a function that calls `call_indirect` and ensure the function call type does not match the function’s return type.     - **Constraint**: Function result types must conform to their definition.     - **Test Relation**: Verifies that the calling function correctly traps when an embedded `call_indirect` has a type mismatch.

(assert_invalid
  (module
    (type $sig1 (func (param f64) (result f64)))
    (type $sig2 (func (param i32) (result i32)))
    (table funcref (elem $f1 $f2))
    (func $f1 (param f64) (result f64)
      local.get 0
    )
    (func $f2 (param i32) (result i32)
      local.get 0
    )
    (func $type-mismatch
      (call_indirect (type $sig1) (i32.const 1) (i32.const 0))
    )
  )
  "type mismatch"
)
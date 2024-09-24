;; - Test 8: Provide mismatched function types in the table such that the runtime should catch type mismatches dynamically. Ensure that the `call_indirect` operation traps without corrupting the stack if the function type defined at the table index does not match the type definition.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i64) (result i32)))
    (func $f (param i64) (result i32)
      (i32.const 0)
    )
    (table funcref (elem $f))
    (func $test
      (call_indirect (type $sig1) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)
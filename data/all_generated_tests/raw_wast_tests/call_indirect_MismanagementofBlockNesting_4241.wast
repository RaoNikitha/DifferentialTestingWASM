;; 10. **Test 10**: Combining multiple call_indirect instructions:     - Place multiple `call_indirect` inside nested structures aiming for layered function calls.     - Ensure that these nested calls handle the correct indices and types without causing unintended traps due to nesting mismanagement.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32) (result f64)))
    (type $sig3 (func (param f64) (result i32)))
    (table funcref (elem $f1 $f2))
    (func $f1 (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
    (func $f2 (param i32) (result f64)
      (f64.convert_i32_s (i32.add (local.get 0) (i32.const 1)))
    )
    (func $nested-call
      (call_indirect (type $sig2) (i32.const 0))
      (call_indirect (type $sig1) (i32.const 1))
    )
    (func (call $nested-call))
  )
  "type mismatch"
)
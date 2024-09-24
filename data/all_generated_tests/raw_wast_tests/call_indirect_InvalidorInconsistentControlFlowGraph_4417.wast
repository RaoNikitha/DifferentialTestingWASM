;; 6. **Test with Recursion and Dynamic Type Checking**:    - Use recursive functions called through `call_indirect` wherein the dynamic type checking plays a crucial role.    - Ensure different recursive paths include valid and invalid type checks.    - This test examines if the recursion tree and its dynamic type checks are correctly reflected in the CFG with proper error trapping.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (result i32)))
    (table funcref (elem $func1 $func2))
    (func $func1 (param i32) (result i32)
      (i32.const 0)
      (call_indirect (type $sig1) (local.get 0))
    )
    (func $func2 (result i32)
      (i32.const 1)
      (call_indirect (type $sig2) (i32.const 1))
    )
    (func $test (param i32) (result i32)
      (call_indirect (type $sig1) (local.get 0))
    )
  )
  "type mismatch"
)
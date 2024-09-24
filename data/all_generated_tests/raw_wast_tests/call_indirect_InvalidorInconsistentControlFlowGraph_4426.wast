;; 5. **Duplicate Function Type with Different Indices Test**:    - **Description**: Have a scenario where two different function bindings in the table have identical types. Use `call_indirect` to call both functions.    - **Constraint**: Ensures the dynamic type checking correctly allows calls to both functions without misinterpreting types.    - **CFG Relation**: Checks that the CFG accurately represents multiple valid paths for different function bindings with the same type index.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (func $f1 (param i32) (result i32) (local.get 0))
    (func $f2 (param i32) (result i32) (local.get 0))
    (table funcref (elem $f1 $f2))
    (func $test
      (call_indirect (type $sig1) (i32.const 0) (i32.const 1))
      (call_indirect (type $sig1) (i32.const 1) (i32.const 1))
    )
  )
  "type mismatch"
)
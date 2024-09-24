;; 7. **Nested `call_indirect` Instructions**: Create a function that uses `call_indirect` to call another function, which in turn uses `call_indirect` again. This tests nested indirect calls.    - **Constraint**: Correct nesting and resolution of indirect calls.    - **CFG Relation**: Tests complex CFG scenarios with nested calls to ensure correct execution paths.

(assert_invalid
  (module
    (type $sig1 (func (param i32)))
    (type $sig2 (func (param i32) (result i32)))
    (table 2 funcref)
    (elem (i32.const 0) $func1 $func2)
    (func $func1 (param i32)
      (call_indirect (type $sig2) (i32.const 1) (local.get 0))
    )
    (func $func2 (param i32) (result i32)
      (i32.const 42) ; dummy return value
    )
    (func $nested_call (param i32)
      (call_indirect (type $sig1) (i32.const 0) (local.get 0))
    )
  )
  "type mismatch"
)
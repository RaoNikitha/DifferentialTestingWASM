;; 8. **Test Description**: Write a test that involves nested function calls with conflicting return types, leading to stack corruption and the potential execution of an 'unreachable' instruction due to type mismatch propagation across calls.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $conflicting-return-types (result f64) 
      (call $nested-call (i32.const 42))
      (unreachable)
    )
    (func $nested-call (param i32) (result i32)
      (i32.const 0)
    )
  )
  "type mismatch"
)
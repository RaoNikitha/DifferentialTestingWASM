;; 2. **Test Description**: Create a scenario where a function with an expected integer return type is called but provided a floating-point return type instead, causing a type inconsistency and potentially hitting an 'unreachable' instruction due to stack misalignment.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (func $test-function (result f32)
      (f32.const 0.0))
    (func $call (result i32)
      (call $test-function))
  )
  "type mismatch"
)
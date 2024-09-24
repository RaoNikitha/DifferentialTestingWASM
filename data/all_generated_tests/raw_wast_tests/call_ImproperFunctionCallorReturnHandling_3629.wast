;; Construct a scenario where a function with no parameters is called, but the stack is pre-loaded with multiple values. Verify if both implementations correctly ignore extra stack values or if one implementation processes these incorrectly.

(assert_invalid
  (module
    (func $no_param_function (result i32) (i32.const 42))
    (func (call $no_param_function (i32.const 1) (i32.const 2)))
  )
  "type mismatch"
)
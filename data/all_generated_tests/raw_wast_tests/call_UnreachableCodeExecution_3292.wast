;; 1. **Test Description**: Define a function with an incorrect parameter type that leads to an unexpected branch, triggering an 'unreachable' instruction. Verify if the control flow reaches the 'unreachable' instruction due to type mismatches.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $incorrect-param-type (param i64) (result i32)
      unreachable)
    (func (call $incorrect-param-type (i32.const 0)))
  )
  "type mismatch"
)
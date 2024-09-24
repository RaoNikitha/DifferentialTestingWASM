;; 1. **Test Description**: Invoke a function imported from another module, which calls multiple internal functions before returning. Verify the operand stack to confirm correct stack unwinding across module boundaries.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func $internal_func (result i32)
      (call $external_func)
      (i32.const 42)
      (return)
    )
    (func $test_func (result i32)
      (call $internal_func)
      (drop)
      (i32.const 0)
      (return)
    )
  )
  "type mismatch"
)
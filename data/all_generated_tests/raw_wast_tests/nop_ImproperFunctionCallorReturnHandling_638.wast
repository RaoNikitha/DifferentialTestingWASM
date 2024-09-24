;; 9. Construct a function that has an early `return` statement after a `nop` and a `call` to another function. Confirm that the early return works correctly without executing the subsequent `call`, verifying that `nop` does not affect the return logic.

(assert_invalid
  (module
    (func $test-func (result i32)
      nop
      return
      (call $another-func)
    )
    (func $another-func (result i32)
      i32.const 42
    )
  )
  "type mismatch"
)
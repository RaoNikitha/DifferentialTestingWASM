;; Test 6: Place an unreachable instruction before a return statement in a function called through an imported function, checking for differential handling and stack state consistency.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func $test_func
      (unreachable)
      (call $external_func)
      (return (i32.const 0))
    )
    (func (export "main") (result i32)
      (call $test_func)
    )
  )
  "type mismatch"
)
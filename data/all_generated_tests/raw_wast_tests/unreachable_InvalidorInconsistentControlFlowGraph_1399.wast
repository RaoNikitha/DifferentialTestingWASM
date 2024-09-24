;; 10. **Unreachable After Function Call:**    - Context: Place `unreachable` immediately after a function call returning a value.    - Constraint: Check if CFG recognizes that the function call's result is never utilized due to immediate trap by `unreachable`.    - Expected Behavior: The called function should execute, but control flow should trap right after due to `unreachable`, consistently across implementations.

(assert_malformed
  (module
    (func $test
      (call $some_function)
      (unreachable)
    )
    (func $some_function (result i32)
      (i32.const 42)
    )
  )
  "unreachable instruction after function call returning a value"
)
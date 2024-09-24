;; 8. Implement a function calling another that returns to validate the combination of `return` and `unreachable` usage within the callee. Both environments should trap at `unreachable` and ignore the return.

(assert_invalid
  (module
    (func $callee
      (unreachable)
      (return (i32.const 1))
    )
    (func (call $callee))
  )
  "type mismatch"
)
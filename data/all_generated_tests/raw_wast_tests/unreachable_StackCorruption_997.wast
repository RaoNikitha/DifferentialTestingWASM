;; 8. Use local variable operations before `unreachable`, such as `local.set` followed by `unreachable`. Check the stack's integrity and ensure no variations in handling memory states across different environments.

(assert_invalid
  (module
    (func (local i32)
      (local.set 0 (i32.const 42))
      (unreachable)
    )
  )
  "type mismatch"
)
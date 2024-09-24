;; 3. Implement a nested call scenario where one function calls another function with its return value. Confirm that the stack's state after the first call is correctly preserved for the second call.

(assert_invalid
  (module
    (func $nested-call
      (call 1 (call 2 (i32.const 42)))
    )
    (func (param i32) (result i32)
      (local.get 0)
    )
    (func (result i32)
      (i32.const 100)
    )
  )
  "type mismatch"
)
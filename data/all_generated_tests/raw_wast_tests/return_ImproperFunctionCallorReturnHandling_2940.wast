;; 9. **Multiple Function Calls with Shared State and Return**:    - Implement a pattern where multiple functions share a state and some of them contain early returns. This evaluates if the shared state remains consistent after returns and if the return instruction across functions is managed correctly.

(assert_invalid
  (module
    (global $state (mut i32) (i32.const 0))
    (func $reset (return (global.set $state (i32.const 0))))
    (func $increment (global.set $state (i32.add (global.get $state) (i32.const 1))) (return))
    (func (export "test") (result i32)
      (call $reset)
      (call $increment)
      (return (global.get $state))
    )
  )
  "type mismatch"
)
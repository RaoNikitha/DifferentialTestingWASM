;; 10. **Return from Callbacks Triggered by Events**:    - Simulate event-driven callbacks that involve `return` instructions within the callbacks. This examines if the return instruction handles stack unwinding properly when returns are triggered by asynchronous events in the form of callbacks.

(assert_invalid
  (module
    (func $return-in-callback (result i32)
      (block
        (call $callback)
      )
      (return (i32.const 0))
    )
    (func $callback (result i32)
      (return (i32.const 1))
    )
  )
  "type mismatch"
)
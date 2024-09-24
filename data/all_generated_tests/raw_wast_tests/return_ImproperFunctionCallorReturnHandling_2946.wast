;; 5. **Function Call with Excess Stack Items**:    Create a function that adds additional items to the stack before returning. Test if the stack unwinding correctly cleans up these extra values upon return.

(assert_invalid
  (module
    (func $excess-stack-items (param i32 i32) (result i32)
      (i32.const 42)
      (return (local.get 0))
    )
  )
  "type mismatch"
)
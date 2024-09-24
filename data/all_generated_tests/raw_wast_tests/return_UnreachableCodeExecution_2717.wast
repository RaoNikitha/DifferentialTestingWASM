;; 6. **Test Scenario**: Craft a function that calls another function which returns, with an unreachable instruction placed in the caller function right after the call.    **Constraint**: Validate `return` transitions back to the caller without issues.    **Unreachable Code**: Check if caller function unexpectedly proceeds to unreachable.

(assert_invalid
 (module
  (func $callee (result i32)
   (i32.const 1)
   (return)
  )
  (func $caller (result i32)
   (call $callee)
   unreachable
  )
 )
 "type mismatch"
)
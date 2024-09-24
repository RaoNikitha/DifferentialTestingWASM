;; 3. **Test: Unreachable in Function Calls**    - Place `unreachable` inside a called function and observe if main function stack gets corrupted.    - **Stack Corruption Check:** Validate that returning from the function doesn’t lead to stack corruption in the caller’s stack frame.

(assert_invalid
  (module
    (func $callee
      (unreachable)
    )
    (func $caller
      call $callee
      (i32.const 0)
    )
  )
  "type mismatch"
)
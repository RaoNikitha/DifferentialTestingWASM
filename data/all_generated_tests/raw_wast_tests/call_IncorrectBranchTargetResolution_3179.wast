;; 8. **Test 8: Multiple Function Calls with Incorrect Stack Cleanup**      Description: Design a test where multiple functions are called sequentially but with deliberate errors in stack cleanup between calls. This checks if both implementations correctly manage stack state between function invocations.      Constraint: Interleave valid and invalid stack manipulations before function calls.      Relation to Branch Target Resolution: Improper stack state can cause incorrect branch resolution when returning from function calls.

(assert_invalid
  (module
    (func $multiple_calls_stack_issue
      (call 0)
      (drop)
      (i32.const 10)
      (call 0)
    )
    (func (result i32)
      (i32.const 5)
    )
  )
  "type mismatch"
)
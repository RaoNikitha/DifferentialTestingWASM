;; 8. **Test Description**:    - **Constraint Checked**: Incorrect Stack Depth Post-call    - **CFG Relevance**: Ensures that the stack is at the correct depth after a function call completes.    - **Expected Behavior**: Differential behavior if the stack depth differs post-call, indicating improper argument handling or result return.

(assert_invalid
  (module
    (func $incorrect-stack-depth-post-call
      (call $test_func)
      (drop)
      (drop)
    )
    (func $test_func (result i32)
      i32.const 42
    )
  )
  "type mismatch"
)
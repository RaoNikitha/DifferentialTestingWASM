;; 2. **Test Nested Function Calls**:    - Call a function that in turn calls another function (`call` within a `call`). Verify the execution order and stack state before and after the calls.    - **Constraint**: Proper stack frame and depth management for nested calls.    - **Improper Call Handling**: The stack frames may become corrupted leading to incorrect behavior.

(assert_invalid
  (module
    (func $nested-call
      (call $first-function)
    )
    (func $first-function
      (call $second-function)
    )
    (func $second-function
      (i32.const 0)
    )
  )
  "type mismatch"
)
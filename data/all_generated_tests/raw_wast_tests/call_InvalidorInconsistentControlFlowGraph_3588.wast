;; 7. **Invalid Recursion Depth**:    - **Test Description**: Call a function recursively until the call stack exceeds the allowable depth.    - **Constraint Checked**: Call stack depth management.    - **CFG Relevance**: Ensures CFG correctly handles deep recursion and traps when limits are breached.

(assert_invalid
  (module
    (func $recursive-call
      (call 0)
    )
  )
  "call stack exhausted"
)
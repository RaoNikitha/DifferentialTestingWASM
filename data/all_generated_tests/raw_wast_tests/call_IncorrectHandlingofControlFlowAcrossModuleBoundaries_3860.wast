;; 9. **Exception Handling Across Module Boundaries**:    - **Reasoning**: Verify that exceptions or traps in imported functions are correctly handled when called from another module.    - **Description**: Implement an imported function designed to throw an exception or trap, then call it and observe if the calling module's error handling mechanism correctly manages the exception in both implementations.

(assert_invalid
  (module
    (import "env" "throwing_func" (func $throwing_func (result i32)))
    (func $caller_func
      (call $throwing_func)
    )
  )
  "unhandled exception"
)
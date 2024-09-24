;; 10. **Recursively Exported Function Call within Loop**:    - Test if a loop calls an exported function that recursively calls back into the loop function. Ensure that the call stack and loop execution flow remain consistent and correct through multiple transitions.    - **Constraint**: Ensures proper handling of recursion involving loops and correct stack state management across module boundaries.

(assert_invalid
  (module
    (func $loop_func (loop (call $exported_func) br 0))
    (func $exported_func (call $loop_func))
    (export "exported_func" (func $exported_func))
  )
  "indirect call stack overflow"
)
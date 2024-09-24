;; 10. **Test Description**:     - **Constraint Checked**: Inconsistent Return Value Types     - **CFG Relevance**: Verifies that the function call correctly manages different return value types, ensuring type checks are consistent.     - **Expected Behavior**: Differential handling or type checking errors when the return types do not match what is expected on the stack.

(assert_invalid
  (module
    (type $sig (func (result f64)))
    (func $test (call 0))
    (table funcref (elem $test))
    (func $call-invalid-return
      (drop (call_indirect (type $sig) (i32.const 0)))
    )
  )
  "type mismatch"
)
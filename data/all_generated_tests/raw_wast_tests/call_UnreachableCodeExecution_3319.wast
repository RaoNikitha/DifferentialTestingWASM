;; 8. **Test Description**:    - **Scenario**: Execute a function with mismatching context assumptions (before and after the call) and follow it with `unreachable`.    - **Constraint Checked**: Correct context state before and after function calls.    - **Unreachable Code Execution**: Incorrect context handling will lead to erroneous `unreachable` execution.    - **Expected Differential Behaviour**: wizard_engine should trap on invalid context transitions, avoiding `unreachable`, while WebAssembly might not trap.

(assert_invalid
  (module
    (type (func (param i32)))
    (func $context-mismatch
      (i32.const 0)
      (call 0)
      (unreachable)
    )
  )
  "type mismatch"
)
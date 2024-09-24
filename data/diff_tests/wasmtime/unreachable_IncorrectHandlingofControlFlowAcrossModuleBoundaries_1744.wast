;; 5. **Trapping in Callee Module Affecting Caller Control Flow:**    - Call an imported function that immediately executes an `unreachable`. Ensure the trap halts the caller's execution and is correctly propagated back to the caller module.    - **Constraint:** Ensure that the control flow back to the calling module is correctly interrupted due to the `unreachable` in the called function.

(assert_invalid
  (module
    (func $called_func (import "env" "callee") (result i32))
    (func (result i32)
      (call $called_func) 
      (drop (i32.const 1))
    )
  )
  "type mismatch"
)
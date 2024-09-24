;; 6. **Test: `unreachable` in Function Call Chain**    - **Goal:** Validate CFG correctness in complex function call chains.    - **Description:** Set up a chain of function calls where `unreachable` is called in one of the downstream functions. Ensure the entire call chain is interrupted and results in a trap.    - **Constraint Checked:** CFG management in function call chain with `unreachable`.

(assert_invalid
  (module
    (func $callee
      (unreachable)
    )
    (func $caller
      (call $callee)
      (i32.const 0) (i32.add)
    )
  )
  "type mismatch"
)
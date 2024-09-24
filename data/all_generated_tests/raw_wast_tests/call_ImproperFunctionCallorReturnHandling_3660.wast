;; 9. **Test Description**: Using `call` to a function that accesses and modifies a global variable.    - **Constraint Checked**: Ensures the function call correctly accesses and modifies global variables.    - **Improper Handling**: Verifies that the global state remains consistent and isolated from stack operations.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $modify_global (global.set $g (i32.const 42)))
    (func $call_modify_global
      (call $modify_global)
      (global.set $g (i32.const 0))
    )
  )
  "type mismatch"
)
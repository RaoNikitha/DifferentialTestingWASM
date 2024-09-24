;; 7. **Test Description**: Call a function while concurrently using global variables that are modified within the function itself. Ensure global state does not corrupt stack behavior.    **Constraint Checked**: Global variable modification and stack behavior integrity.    **Relation to Stack Corruption**: Incorrect handling of globals may destabilize the expected stack state.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $modify-global (global.set $g (i32.const 10)))
    (func $test-stack-integrity
      (call $modify-global)
      (i32.const 0)
    )
  )
  "type mismatch"
)
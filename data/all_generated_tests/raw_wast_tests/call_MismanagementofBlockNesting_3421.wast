;; 10. **Deeply Nested Blocks with Global Access Function Calls**:     - **Description**: Use global variables accessed and modified within deeply nested blocks, and trigger function calls that validate global state correctness.     - **Constraint**: Validate function calls based on correct state management of globals across nested block transitions.     - **Relation to Mismanagement of Block Nesting**: Tests robust handling of nested interactions with global variables and ensuring proper state during function invocations.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $set-global (global.set $g (i32.const 42)))
    (func $check-global
      (if (i32.eqz (global.get $g))
        (then
          (call $set-global)
        )
        (else
          (if (i32.eqz (global.get $g))
            (then
              (call $set-global)
            )
          )
        )
      )
    )
    (func $main
      (block
        (block
          (block
            (block
              (call $check-global)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
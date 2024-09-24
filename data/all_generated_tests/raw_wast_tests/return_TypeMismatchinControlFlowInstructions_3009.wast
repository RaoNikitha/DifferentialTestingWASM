;; 8. **Non-Empty Stack on Return from Block**:    - Create a scenario where a block should empty the stack via `return`, but residual values are left on the stack unexpectedly.    - **Constraint:** Ensure `return` correctly unwinds the stack in its entirety as needed.    - **Type Mismatch:** Checks the mechanism of stack unwinding and type consistency at function return.

(assert_invalid
  (module
    (func $non-empty-stack-on-return (result i32)
      (block (result i32)
        (i32.const 42)
        (i32.const 13)
        (return)
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)
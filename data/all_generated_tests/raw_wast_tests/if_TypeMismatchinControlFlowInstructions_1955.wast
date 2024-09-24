;; 6. **Test Description**: Generate a test where the `if` instruction has mismatched input stack types for the branches, e.g., `then` expects `[i32 i32]` and `else` expects `[i32]`.    - **Constraint Checked**: Maintain consistency in operand stack requirements for both `then` and `else` instructions.    - **Expected Behavior**: The stack input types should remain uniform, failing which should trigger validation errors.

(assert_invalid
  (module (func $mismatched-stack-types (result i32)
    (if (result i32)
      (i32.const 1)
      (then (i32.add (i32.const 1) (i32.const 2)))
      (else (i32.const 3))
    )
  ))
  "type mismatch"
)
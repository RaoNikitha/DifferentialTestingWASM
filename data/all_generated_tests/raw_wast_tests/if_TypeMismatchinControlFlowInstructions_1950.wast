;; 1. **Test Description**: Create a test where the `if` instruction is expected to produce an `i32` type output, but its `then` branch produces an `f32` value.    - **Constraint Checked**: Verify stack output type consistency within control flow branches.    - **Expected Behavior**: The implementation must catch the type mismatch between the expected and produced block type output.

(assert_invalid
  (module (func $type-mismatch-then-branch
    (if (result i32)
      (i32.const 1)
      (then (f32.const 0.0))
    )
  ))
  "type mismatch"
)
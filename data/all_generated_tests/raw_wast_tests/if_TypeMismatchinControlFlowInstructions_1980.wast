;; 1. **Test Description**:    - Create an `if` instruction where the block type expects a single `i32` type as output, but the `then` branch pushes an `f32` value to the stack.    - **Constraint Checked**: Mismatch in the result type `i32` vs. `f32` between the block type and `then` branch output.    - **Target**: Validate correct handling of type mismatch and type enforcement in control flow.

(assert_invalid
  (module (func (result i32)
    (if (result i32) (i32.const 1) (then (f32.const 1.0)) (else (i32.const 1)))
  ))
  "type mismatch"
)
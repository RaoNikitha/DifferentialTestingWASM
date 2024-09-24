;; 5. **Forward Branch with Complex Stack Scenario**:    - **Description**: Conditionally branch forward out of multiple nested `if` blocks via `br_if`, with varied stack operations preceding the branch. Check for proper operand stack handling.    - **Constraint Checked**: Forward jumper operand correctness.    - **Relation to Stack Corruption**: Tests if the forward branch correctly resets the stack.

(assert_invalid
  (module
    (func $forward-branch-complex-stack (result i32)
      (block (result i32)
        (if (result i32)
          (then
            (block (result i32)
              (i32.const 42)
              (i32.const 1)
              (br_if 0)
            )
            (i32.const 10)
          )
        )
        (i32.const 20)
      )
    )
  )
  "type mismatch"
)
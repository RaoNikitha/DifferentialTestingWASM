;; 1. **Unreachable Branch with Empty Stack Test**:    - **Description**: Test a `br_if` instruction that is part of an unreachable branch with an empty operand stack. Confirm that `wizard_engine` raises an error for stack underflow while the WASM implementation implicitly handles this with type inference.    - **Constraint Checked**: Ensures proper handling of stack underflow in unreachable code paths.    - **Relation to Stack Corruption**: Verifies that the `br_if` instruction does not corrupt the stack when executed in unreachable sections.

(assert_invalid
  (module
    (func $unreachable-branch-with-empty-stack
      (block
        (unreachable)
        (br_if 0 (i32.const 1))
      )
    )
  )
  "stack underflow"
)
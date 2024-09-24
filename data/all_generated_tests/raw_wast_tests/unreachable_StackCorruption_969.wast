;; 10. **Test Description:**    - **Scenario:** Place `unreachable` within the `else` branch of an `if` block, where the `then` branch changes the stack.    - **Specific Constraint Checked:** Verifies that the stack state is intact after the trap, ignoring stack changes from the unreachable path.    - **Relation to Stack Corruption:** Confirms stack integrity when branching logic includes unreachable paths.

(assert_invalid
  (module (func $type-if-else-with-unreachable (result i32)
    (if (result i32) (i32.const 1)
      (then (i32.const 42))
      (else (unreachable))
    )
  ))
  "type mismatch"
)
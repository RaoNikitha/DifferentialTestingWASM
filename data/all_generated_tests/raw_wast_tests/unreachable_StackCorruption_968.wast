;; 9. **Test Description:**    - **Scenario:** Execute `unreachable` in a function’s prologue before parameter values are moved to local variables.    - **Specific Constraint Checked:** Checks that the trap occurs without affecting initialized parameter values in the stack.    - **Relation to Stack Corruption:** Ensures that trapping does not result in stack corruption at function entry points.

(assert_invalid
  (module (func $unreachable-before-param-local (param i32) (result i32)
    (unreachable)
    (local.get 0)
  ))
  "type mismatch"
)
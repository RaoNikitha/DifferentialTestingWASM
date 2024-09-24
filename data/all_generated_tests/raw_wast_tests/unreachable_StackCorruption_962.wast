;; 3. **Test Description:**    - **Scenario:** Place `unreachable` at the end of an `if` block where the then-branch pushes a value to the stack.    - **Specific Constraint Checked:** Validates that the stack remains unaffected by the conditional, as the trap prevents further execution.    - **Relation to Stack Corruption:** Confirms no stack alteration by conditional branches beyond the trap point.

(assert_invalid
  (module
    (func $test-unreachable-if-block
      (if (then (i32.const 42)) (unreachable))
      (i32.const 0)
    )
  )
  "type mismatch"
)
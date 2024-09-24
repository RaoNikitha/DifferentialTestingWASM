;; 2. **Test Description:**    - **Scenario:** Execute `unreachable` within a loop, which should trap before the loop alters stack state.    - **Specific Constraint Checked:** Ensures the loop’s stack manipulation is ignored due to the immediate trap triggered by `unreachable`.    - **Relation to Stack Corruption:** Validates that no incorrect loop iteration or stack changes occur post-trap.

(assert_invalid
  (module (func $unreachable-in-loop-stack-test (result i32)
    (loop (result i32) (unreachable) (i32.const 1))
  ))
  "stack type mismatch"
)
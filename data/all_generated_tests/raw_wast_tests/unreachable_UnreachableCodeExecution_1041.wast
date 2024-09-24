;; 2. **Conditional Branch to Unreachable:**    - **Description:** Use an `if` statement that unconditionally branches to an `unreachable` instruction. The true branch should always trigger the trap.    - **Constraint:** Tests the integrity of control flow branching.    - **Relation to Unreachable Code Execution:** Ensures that the control flow correctly handles branch instructions leading to `unreachable`.

(assert_invalid
  (module
    (func $conditional-branch-to-unreachable
      (if (i32.const 1) (then unreachable))
    )
  )
  "type mismatch"
)
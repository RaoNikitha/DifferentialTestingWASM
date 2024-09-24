;; 4. **Test Description:**    - **Scenario:** Incorporate `unreachable` immediately after a br_table instruction with a mismatched stack state.    - **Specific Constraint Checked:** Ensures the trap caused by `unreachable` overrides any stack changes expected by br_table.    - **Relation to Stack Corruption:** Validates no stack mismatch occurs when transitioning from br_table to `unreachable`.

(assert_invalid
  (module (func $test-unreachable-after-br_table
    (block
      (br_table 0 0 (i32.const 1))
      (unreachable)
    )
  ))
  "type mismatch"
)
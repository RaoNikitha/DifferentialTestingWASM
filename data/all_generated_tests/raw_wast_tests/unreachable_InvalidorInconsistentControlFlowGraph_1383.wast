;; 4. **Test: `unreachable` in Switch-Case Statements**    - **Goal:** Examine CFG management with `unreachable` in switch-case constructs.    - **Description:** Create a switch-case statement where every case ends with `unreachable`. Ensure the control flow traps immediately upon hitting any case and does not proceed to subsequent instructions.    - **Constraint Checked:** CFG correctness in switch-case constructs with `unreachable`.

(assert_invalid
  (module (func $unreachable-switch-case
    (block
      (br_table 0 1 2 (i32.const 1))
      (unreachable)
      (unreachable)
      (unreachable)
    )
  ))
  "type mismatch"
)
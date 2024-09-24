;; 6. **Test Description:**    - **Scenario:** Insert the `unreachable` instruction in an `else` branch expected to not execute under normal circumstances.    - **Constraint Checked:** Verifies that if the `else` branch is incorrectly reached, the `unreachable` traps.    - **Relation to Unreachable Code Execution:** Ensures errors reaching unexpected `else` blocks trigger a program trap.

(assert_invalid
  (module (func $test_unreachable_else
    (if (i32.const 1)
      (then)
      (else (unreachable))
    )
  ))
  "type mismatch"
)
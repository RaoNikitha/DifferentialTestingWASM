;; 10. **Branching across Module Boundaries Involving Unreachable:**     - Set up a scenario where an imported function is used within a conditional branch in the calling module, and both branches contain `unreachable`. Ensure traps are consistent regardless of which branch is taken.     - **Constraint:** Validate correctness of control flow and trapping across module boundaries when branches involving `unreachable` instruction are executed.

(assert_invalid
  (module
    (import "test" "func" (func $external_func))
    (func $test_func (param i32) (result i32)
      (if (i32.eqz (local.get 0))
        (then (unreachable))
        (else (unreachable))
      )
    )
  )
  "unreachable must trap"
)
;; 7. **Test Description:** Place the `unreachable` instruction inside a `loop` which is exited via a `br` instruction before reaching the `unreachable`.    **Constraint:** The loop should not trap since the `unreachable` is bypassed by the `br` instruction.    **Relation to Unreachable Code Execution:** Verifies correct handling of loop exits and confirms that reaching the `unreachable` is necessary for a trap.

(assert_invalid
  (module
    (func $test-loop-br-exit
      (loop
        (br 0)
        (unreachable)
      )
    )
  )
  "type mismatch"
)
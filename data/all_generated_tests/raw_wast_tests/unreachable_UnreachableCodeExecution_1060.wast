;; 1. **Test Description:** Execute a loop that contains an `unreachable` instruction at the end. The loop should iterate a few times, performing valid operations before reaching the `unreachable`.    **Constraint:** Ensures the loop does not continue past the `unreachable`, and should result in a trap.    **Relation to Unreachable Code Execution:** Verifies that once `unreachable` is hit, no subsequent iterations occur.

(assert_invalid
  (module
    (func $type-loop-after-unreachable (result i32)
      (loop
        (unreachable)
      )
      i32.const 0
    )
  )
 "type mismatch"
)
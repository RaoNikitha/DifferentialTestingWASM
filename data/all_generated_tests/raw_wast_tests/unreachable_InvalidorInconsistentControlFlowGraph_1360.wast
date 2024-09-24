;; 1. **Test Case: Unreachable Inside Nested Loops**    - Description: Place the `unreachable` instruction inside nested loops to observe if the trap is consistently handled across different depths of nested loops.    - CFG Constraint: Testing if the inner loop is correctly interrupted by the `unreachable` instruction and doesn't continue execution.

(assert_invalid
  (module (func $unreachable-nested-loops
    (loop (result i32)
      (loop (result i32)
        (unreachable)
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)
;; 1. **Unreachable Within Loop After Valid Operations**:    Create a loop with valid operations followed by an `unreachable` instruction at the end of the loop body. Test if the loop correctly processes valid operations and traps on hitting `unreachable`.

(assert_invalid
  (module
    (func $unreachable-within-loop
      (loop (result i32)
        (i32.const 1)
        (i32.const 2)
        unreachable
      )
    )
  )
  "type mismatch"
)
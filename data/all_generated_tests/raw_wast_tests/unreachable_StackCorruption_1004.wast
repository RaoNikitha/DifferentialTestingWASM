;; 5. **Function Calls Before `unreachable`:**    - **Description:** Call a function that pushes multiple values onto the stack followed by an `unreachable` instruction to ensure stack integrity after the trap.    - **Constraint:** Verify stack state before and after the `unreachable` instruction.    - **Relation to Stack Corruption:** Ensures function call stack frames are maintained even when interrupted.

(assert_invalid
  (module
    (func $push-values
      i32.const 10
      f32.const 20.0
      drop
      drop
    )
    (func $test
      call $push-values
      unreachable
      i32.add
    )
  )
  "type mismatch"
)
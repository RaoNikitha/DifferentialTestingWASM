;; 5. **Unreachable Post-Loop Return Test:**    - Place an `unreachable` instruction immediately after a `loop` construct and includes a `return` instruction. Verify that execution traps as expected without wrongly continuing to the return, and ensure the trap signal is correctly handled.

(assert_invalid
  (module (func $unreachable-post-loop-return
    (result i32)
    (block (result i32)
      (loop
        (br 0)
      )
      (unreachable)
      (return (i32.const 1))
    )
  ))
  "type mismatch"
)
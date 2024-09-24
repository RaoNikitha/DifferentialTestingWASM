;; 4. **Test 4**: Simulate a function that returns early, placing `nop` instructions before the `return` statement and an `unreachable` instruction after to ensure the function exits correctly and the unreachable code path is not accidentally executed.

(assert_invalid
  (module (func
    (block
      nop
      (return)
      unreachable
    )
  ))
  "unreachable code expected"
;; 1. **Test 1**: Include several `nop` instructions between valid instructions and an `unreachable` instruction to check if control flow continues correctly and reaches the `unreachable` instruction, triggering a trap as expected.

(assert_trap
  (module
    (func $test
      nop
      nop
      unreachable
    )
    (start $test)
  )
  "unreachable"
)
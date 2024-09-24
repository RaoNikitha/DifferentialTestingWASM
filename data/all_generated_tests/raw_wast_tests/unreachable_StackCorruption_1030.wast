;; 1. Test Description: Execute a sequence that pushes several integer values onto the stack and then uses the `unreachable` instruction immediately followed by an `i32.add` instruction. This tests if `unreachable` correctly interrupts stack usage without causing further computation.

(assert_invalid
  (module (func $test-unreachable-interrupt
    (i32.const 1)
    (i32.const 2)
    (unreachable)
    (i32.add)
  ))
  "type mismatch"
)
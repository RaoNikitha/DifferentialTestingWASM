;; 1. Test a function containing a `block` instruction where the body ends with an `unreachable` instruction, but subsequent code incorrectly assumes that the block produces a specific type, which it shouldn't due to the trap.

(assert_invalid
  (module (func $test-block-unreachable-type-mismatch
    (block (unreachable) (i32.const 1))
  ))
  "type mismatch"
)
;; - Execute a sequence where a condition evaluates to false, but the `br_if` instruction takes the branch nevertheless, followed by an `unreachable` instruction. This checks if `br_if` incorrectly leads to the trap regardless of the condition.

(assert_invalid
  (module (func $test-unreachable-in-br_if
    (block
      (br_if 0 (i32.const 0))
      (unreachable)
    )
  ))
  "type mismatch"
)
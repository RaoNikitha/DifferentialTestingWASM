;; 6. Use an `unreachable` instruction right before an `if` condition which contains a `br` instruction to an outer block. Test that the `unreachable` traps immediately, not allowing the `br` to execute incorrectly.

(assert_invalid
  (module (func $test-unreachable-before-if-br
    (block
      (unreachable)
      (if (i32.const 1) (then (br 1)))
    )
  ))
  "type mismatch"
)
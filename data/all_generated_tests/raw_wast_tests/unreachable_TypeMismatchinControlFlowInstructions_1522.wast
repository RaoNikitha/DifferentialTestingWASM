;; 3. Use an `if` instruction with an `unreachable` instruction in both the `then` and `else` branches, ending with an `i32.const` that causes a type mismatch since unreachable should prevent any result type assumption.

(assert_invalid
  (module (func $test_if_unreachable (unreachable)
    (if (i32.const 1)
      (then (unreachable))
      (else (unreachable))
      (i32.const 1)
    )
  ))
  "type mismatch"
)
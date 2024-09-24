;; - **Test 7**: In an `if`-`else` construct, place a `br_if` in the `then` branch with an always false condition, followed by an `unreachable`. This ensures that the `br_if` does not unexpectedly execute the `unreachable` instruction.

(assert_invalid
  (module (func
    (if (i32.const 0)
      (then (unreachable) (br_if 0 (i32.const 0)))
      (else)
    )
  ))
  "unreachable instruction executed"
)
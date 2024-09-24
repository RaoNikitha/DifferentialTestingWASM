;; Formulate an `if` block where a true condition performs a break to a label outside the `if` block followed by an `unreachable` instruction, ensuring the break doesn't trap.

(assert_invalid
  (module (func $test-if-break
    (block $outer
      (i32.const 1)
      (if (result i32)
        (then (br $outer))
        (else (unreachable))
      )
      (unreachable)
    )
  ))
  "type mismatch"
)
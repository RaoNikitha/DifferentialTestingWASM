;; 2. Implement an `if` instruction with a true condition followed by valid instructions, but place an `unreachable` instruction immediately after the `else` block. Validate if control erroneously reaches past the `else` to the `unreachable`.

(assert_invalid
  (module
    (func $if_unreachable_after_else
      (i32.const 1)
      (if (result i32)
        (then (i32.const 0))
        (else (i32.const 2))
      )
      (unreachable)
    )
  )
  "type mismatch"
)
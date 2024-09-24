;; 5. Create an `if` block with an invalid stack manipulation leading to an `unreachable` instruction. Ensure the differential test identifies the improper stack state causing the trap before executing any following instructions.

(assert_invalid
  (module
    (func
      (if
        (result i32)
        (i32.const 1)
        (then (unreachable))
        (else)
      )
    )
  )
  "type mismatch"
)
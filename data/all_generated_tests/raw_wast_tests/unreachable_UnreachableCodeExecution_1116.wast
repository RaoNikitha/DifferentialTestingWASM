;; 7. Implement a function that uses `if` statements to handle different cases, where a specific case leads to an `unreachable` instruction. Confirm that the trap happens only when that specific case is processed.

(assert_invalid
  (module
    (func $test_unreachable_if (result i32)
      (if (i32.const 1)
        (then (unreachable))
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)
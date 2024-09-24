;; Design a test case where the `if` block contains function calls that conditionally execute an `unreachable` instruction, checking if invalid function paths avoid trapping.

(assert_invalid
  (module
    (func $conditional-unreachable
      (i32.const 0)
      (if (then (unreachable)) (else (drop)))
    )
  )
  "type mismatch"
)
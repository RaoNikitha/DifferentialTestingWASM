;; 8. Implement a sequential `if` instruction where the first `then` block contains a correct path, and the second `else` block has an `unreachable`. Ensure proper execution only follows the correct path, trapping otherwise.

(assert_invalid
  (module
    (func $sequential-if
      (i32.const 1)
      (if (result i32)
        (then (i32.const 2))
        (else unreachable)
      )
      (drop)
    )
  )
  "type mismatch"
)
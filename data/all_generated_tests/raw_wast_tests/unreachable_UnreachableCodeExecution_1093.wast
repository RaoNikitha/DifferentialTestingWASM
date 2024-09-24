;; 4. Use the `br` (branch) instruction to jump out of a nested block directly to an `unreachable` instruction. Verify that a proper unconditional trap occurs and does not proceed past the `unreachable` instruction.

(assert_invalid
  (module (func $test-br-to-unreachable
    (block
      (block
        (br 1)
        (unreachable)
      )
    )
  ))
  "type mismatch"
)
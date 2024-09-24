;; Create a `loop` instruction that contains an `unreachable` instruction within a nested `block`. Test that the control flow does not execute this `unreachable` when a conditional branch (`br_if`) correctly bypasses the `block`.

(assert_malformed
  (module quote
    "(func
      (loop (result i32)
        (block 
          (br_if 0 (i32.const 0))
          (unreachable)
        )
      )
    )"
  )
  "unexpected token"
)
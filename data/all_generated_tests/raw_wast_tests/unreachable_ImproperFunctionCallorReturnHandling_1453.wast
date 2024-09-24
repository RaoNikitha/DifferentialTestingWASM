;; 4. Use a `block` control structure containing an `unreachable` followed by a `call`. Check if the `unreachable` instruction causes an immediate trap, thus the call inside the block is never executed.

(assert_invalid
  (module (func $type-block-unreachable-followed-by-call
    (block
      (unreachable)
      (call 0)
    )
  ))
  "type mismatch"
)
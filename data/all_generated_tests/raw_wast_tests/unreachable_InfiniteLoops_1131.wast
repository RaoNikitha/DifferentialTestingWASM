;; Insert an `unreachable` instruction inside of a conditional block within a loop, ensuring the condition can never evaluate to true to verify if the loop stops correctly. This checks if the `unreachable` instruction causes an immediate trap and not fall through.

(assert_invalid
  (module (func (loop (if (i32.const 0) (then (unreachable))) (nop)))
  )
  "type mismatch"
)
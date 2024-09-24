;; 1. Embed a `nop` instruction inside an infinite `loop` without any break conditions. This tests if the `nop` instruction improperly affects stack/state and contributes to infinite looping.

(assert_invalid
  (module (func (loop (nop) (br 0))))
  "validation error"
)
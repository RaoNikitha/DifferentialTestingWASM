;; Place an `unreachable` instruction after a `br` instruction within a loop, ensuring the branch instruction skips over `unreachable`. The test checks for any unintended loop behavior if the branch did not skip correctly.

(assert_invalid
  (module (func (loop (br 0) (unreachable))))
  "type mismatch"
)
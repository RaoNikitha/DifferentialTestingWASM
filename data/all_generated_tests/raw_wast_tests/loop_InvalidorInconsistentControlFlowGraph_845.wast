;; Design a loop with an empty body and a `br` instruction that never gets executed to verify if the CFG correctly identifies unreachable code within a loop.

(assert_invalid
  (module (func (loop (br 0))))
  "unreachable code"
)
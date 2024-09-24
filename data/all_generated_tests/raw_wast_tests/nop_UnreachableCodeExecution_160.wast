;; 1. Execute a simple `nop` followed directly by an `unreachable` instruction. Validate that `nop` does not alter the execution, leading to the `unreachable` instruction being executed.

(assert_invalid
  (module (func (nop) (unreachable)))
  "unreachable executed"
)
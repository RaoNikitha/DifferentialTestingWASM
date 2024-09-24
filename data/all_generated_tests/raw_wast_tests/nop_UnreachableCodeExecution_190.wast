;; Test 1: Insert a `nop` instruction immediately before an `unreachable` instruction within a function. Verify that `nop` indeed does nothing and does not prevent the `unreachable` instruction from causing a trap.

(assert_invalid
  (module
    (func (nop) (unreachable))
  )
  "unreachable executed"
)
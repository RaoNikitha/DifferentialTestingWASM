;; 4. Nest a `nop` instruction within a loop that leads to an `unreachable` instruction outside the loop. Ensure the control does not bypass the loop and run the `unreachable` instruction.

(assert_invalid
  (module
    (func (loop (nop)) (unreachable)))
  "unreachable executed"
)
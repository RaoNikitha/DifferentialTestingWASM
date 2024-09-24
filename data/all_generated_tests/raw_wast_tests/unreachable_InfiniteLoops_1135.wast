;; Test a nested loop scenario where the inner loop contains an `unreachable` instruction and ensure the outer loop handles the trap correctly, preventing the loops from running indefinitely if `unreachable` is reached.

(assert_invalid
  (module (func $nested-loop-unreachable
    (loop (loop (unreachable) (br 0)))
  ))
  "type mismatch"
)
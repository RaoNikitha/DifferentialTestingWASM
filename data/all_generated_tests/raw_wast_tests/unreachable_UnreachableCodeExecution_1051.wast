;; 2. Test a function with a loop that iterates until a condition is false, but includes an `unreachable` instruction within the loop to verify it causes an immediate trap.

(assert_invalid
  (module (func $type-loop-unreachable-test
    (loop (unreachable) (br 0))
  ))
  "type mismatch"
)
;; Create a nested loop where the `unreachable` instruction is inside an inner loop’s conditional `br_if`. Ensure the outer loop continues and the test checks if the trap occurs immediately upon reaching `unreachable`.

(assert_invalid
  (module (func $test-unreachable-in-loop
    (loop (block (loop (br_if 0 (unreachable)))))
  ))
  "type mismatch"
)
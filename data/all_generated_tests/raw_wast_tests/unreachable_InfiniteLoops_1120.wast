;; 1. Create a loop with an `unreachable` instruction placed within the body of the loop. The loop should have a condition that would otherwise cause it to run indefinitely if not for the `unreachable` instruction. The test ensures that the loop properly terminates due to the trap caused by `unreachable`. If one implementation continues looping, it indicates a failure to handle the trap correctly.

(assert_invalid
  (module (func $loop-unreachable
    (loop (unreachable))
  ))
  "unreachable and trap mismatch"
)
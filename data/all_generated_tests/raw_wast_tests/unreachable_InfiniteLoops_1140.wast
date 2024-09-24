;; Test 1: Construct a loop containing an `unreachable` instruction followed by a `br` instruction to test if the loop terminates correctly or runs indefinitely.

(assert_invalid
  (module (func $type-loop-unreachable-br
    (loop (br 0) (unreachable))
  ))
  "type mismatch"
)
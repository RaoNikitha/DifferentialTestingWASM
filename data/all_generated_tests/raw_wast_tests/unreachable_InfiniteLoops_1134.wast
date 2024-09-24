;; Implement a loop containing an `unreachable` instruction followed by a `br` that would conditionally jump back to test whether the unreachable correctly terminates the execution flow, preventing infinite loops.

(assert_invalid
  (module (func $test-unreachable-in-loop
    (loop
      unreachable
      (br 0)
    )
  ))
  "type mismatch"
)
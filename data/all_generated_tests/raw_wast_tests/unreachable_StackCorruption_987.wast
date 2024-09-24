;; 8. Construct a loop with multiple iterations, including an `unreachable` instruction within a single iteration. Ensure that the loop terminates and subsequent iterations are not executed, preserving the stack state.

(assert_invalid
  (module (func $loop-with-unreachable
    (loop (br_if 1 (i32.const 0)) (unreachable))
  ))
  "type mismatch"
)
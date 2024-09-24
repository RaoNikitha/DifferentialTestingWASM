;; 2. Use an `unreachable` instruction within a loop that should produce an `i64`, but insert `i32` result-producing instructions instead. Check if the engine reports a mismatch correctly or fails.

(assert_invalid
  (module (func $type-loop-unreachable-mismatch (result i64)
    (loop (unreachable) (i32.const 0))
  ))
  "type mismatch"
)
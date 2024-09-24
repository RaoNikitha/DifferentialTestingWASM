;; 2. **Infinite Loop with Constant True Condition**: Design a test where an `if` instruction always evaluates to true and inside it contains a `loop` with a `br` instruction to the loop label. Ensure the loop exits correctly instead of running indefinitely.

(assert_invalid
  (module (func $infinite-loop-if-true
    (if (result i32) (i32.const 1)
      (then (loop (result i32)
        (br 0)
      ))
    )
  ))
  "start type mismatch"
)
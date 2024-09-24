;; 1. **Infinite Loop with Constant False Condition**: Create a test where an `if` instruction always evaluates to false and contains a `loop` that should be skipped. Verify if the implementation properly skips the `loop` or enters it, causing an infinite loop.

(assert_invalid
  (module (func $infinite-loop-false-cond
    (i32.const 0)
    (if (result i32)
      (then (loop (result i32) (br 1) (unreachable)))
      (else (i32.const 0))
    )
  ))
  "type mismatch"
)
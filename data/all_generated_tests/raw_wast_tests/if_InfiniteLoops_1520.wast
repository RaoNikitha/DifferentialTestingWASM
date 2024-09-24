;; 1. **Infinite Loop with Simple Condition:**    - Test Condition: Test an `if` instruction within a `loop`, where the condition is a constant non-zero value and should always execute the `then` block, leading to an infinite loop.    - Constraint: Ensures both implementations correctly handle constant conditions and prevent unnecessary jumps.    - Relevance: Tests for potential divergence in control flow due to incorrect loop exits.

(assert_invalid
  (module (func (result i32)
    (loop (result i32)
      (if (result i32) (i32.const 1)
        (then (br 0) (i32.const 42))
        (else (i32.const 0))
      )
    )
  ))
  "type mismatch"
)
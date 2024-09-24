;; 2. **Loop with Unreachable Code**:    - Description: Design a loop containing an unconditional `br` that targets a block following the loop, and include an `unreachable` instruction within the loop. Verify whether the branch bypasses the `unreachable` correctly.    - Reasoning: Ensures that the `br` instruction skips over any `unreachable` code as intended, testing branch resolution around `unreachable`.

(assert_invalid
  (module (func (result i32)
    (loop (result i32)
      (br 1)
      (unreachable)
    )
  ))
  "type mismatch"
)
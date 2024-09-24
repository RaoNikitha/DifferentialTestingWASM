;; 2. **Unreachable Within Nested Loop**:    Implement a loop that contains a nested loop, where the inner loop ends with the `unreachable` instruction. Verify if the outer loop properly resumes after the inner loop correctly handles the trap due to reaching `unreachable`.

(assert_invalid
  (module
    (func $unreachable-within-nested-loop
      (loop $outer (result i32)
        (loop $inner
          (unreachable)
        )
        (i32.const 0)
      )
    )
  )
  "unreachable instruction within nested loop"
)
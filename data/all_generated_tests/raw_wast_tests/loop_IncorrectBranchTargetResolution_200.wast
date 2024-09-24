;; 1. **Nested Loop with Simple Branch**    - Test a nested loop where a `br` instruction branches back to the inner loop. This checks if the inner loop restarts correctly. Ensure that the inner loop label is resolved correctly.

(assert_invalid
  (module
    (func $nested-loop-branch
      (result i32)
      (loop (result i32)
        (loop (result i32)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)
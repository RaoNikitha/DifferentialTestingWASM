;; 1. **Test for Incorrect Handling of Nested Loop Branching**:    Create a nested loop where an inner loop has a `br` instruction that should target the outer loop, and verify if execution correctly reinitializes the outer loop. This tests if the branch resolves to the correct outer loop.

(assert_invalid
  (module (func $nested-loop-br-target-outer (result i32)
    (loop (result i32)
      (loop (result i32)
        (br 1)  ;; should target the outer loop
      )
    )
  ))
  "invalid jump target"
)
;; 7. **Backward Branch to Loop Test**: Implement a `br` instruction within a nested block that attempts to branch backward into a loop. Verify that the branch resolves to the loop start and that operand stacks are properly matched and managed.

(assert_invalid
  (module
    (func
      (loop (result i32)
        (block
          (br 1)  ;; Attempt to branch backward to 'loop'
        )
      )
    )
  )
  "type mismatch"
)
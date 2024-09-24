;; 2. **Test 2: Unreachable in Nested Loop Backward Branch**    - Create a nested `loop` structure with an outer loop containing an unreachable instruction after an inner loop where the `br` instruction targets the inner loop.    - Ensures the branch correctly jumps back to the start of the inner loop, skipping the outer `unreachable`.

(assert_invalid
  (module
    (func
      (block
        (loop
          (block
            (br 1)
            (unreachable)
          )
          (nop)
        )
        (unreachable)
      )
    )
  )
  "unreachable code"
)
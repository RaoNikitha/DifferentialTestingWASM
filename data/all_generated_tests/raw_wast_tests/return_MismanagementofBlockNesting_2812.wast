;; 1. **Nested Loop Exit**: Create a function with multiple nested loops, and within the innermost loop, use the `return` instruction to exit the outermost function. The test checks if the `return` correctly identifies and exits the function rather than an incorrect loop or block.

(assert_invalid
  (module
    (func (result i32)
      (block
        (loop
          (block
            (loop
              (return)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
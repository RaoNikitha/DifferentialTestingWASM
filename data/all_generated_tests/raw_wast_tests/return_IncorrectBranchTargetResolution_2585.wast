;; 4. **Test with Conditional Blocks and Return**    - **Description**: Create conditional blocks (if-else) within a function and place a `return` inside the else block.    - **Constraint**: Ensures that irrespective of the conditions met, the `return` instruction chooses the correct outermost block to return from.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 1)
      (if (result i32)
        (then (i32.const 2))
        (else (return))
      )
    )
  )
  "type mismatch"
)
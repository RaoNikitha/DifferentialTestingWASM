;; 6. **Test Description**: Formulate a block with a stack-consuming instruction before the `end` instruction in the final place, ensuring it does not leave the stack in an incorrect state when leaving the block context.

(assert_invalid
  (module (func
    (block (result i32)
      (i32.const 1)
      (drop)
    )
  ))
  "type mismatch"
)
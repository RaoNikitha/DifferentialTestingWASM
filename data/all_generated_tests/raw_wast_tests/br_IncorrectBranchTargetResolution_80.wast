;; 1. **Nested Block Test**:    - Create a nested block structure (`block`, within another `block`), and use the `br` instruction to jump to the outer block. Check if the branch correctly skips the inner block and moves to the code after the outer block. This ensures proper label indexing and prevents jumping to the wrong block.

(assert_invalid
  (module (func
    (block
      (block
        (br 1)
      )
    )
  ))
  "type mismatch"
)
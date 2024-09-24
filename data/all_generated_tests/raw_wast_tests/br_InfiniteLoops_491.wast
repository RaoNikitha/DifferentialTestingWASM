;; 2. **Unconditional Branch to Loop Initialization**: Implement a `br` instruction within a nested control structure that attempts to jump back to the beginning of the outermost loop instead of continuing to the next instruction. This ensures that the implementation correctly handles label resolution and avoids infinite loops.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (block (result i32)
          (br 1)
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)
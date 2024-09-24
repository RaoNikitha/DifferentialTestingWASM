;; 5. **Test Description**: A `block` with an early terminating `br` instruction and subsequent code that should be skipped if the branch works correctly.    **Reasoning**: Confirms that the `br` instruction correctly jumps to the end of the block, avoiding the execution of remaining instructions.

(assert_invalid
  (module (func $block-br-skip-code
    (block
      (br 0)
      (i32.const 42)
      (drop)
    )
  ))
  "type mismatch"
)
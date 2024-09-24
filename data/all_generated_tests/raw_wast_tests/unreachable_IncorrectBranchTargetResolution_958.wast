;; 9. **Block to Loop Target Confusion Test:**    - Implement a block containing a loop, both hosting a `br` instruction targeting the loop. Place an `unreachable` in the block to check if the trap prevents incorrect block-to-loop branch execution.

(assert_invalid
  (module (func $block_to_loop_confusion
    (block 
      (loop 
        (br 1)
        (unreachable)
      )
      (unreachable)
    )
  ))
  "type mismatch"
)
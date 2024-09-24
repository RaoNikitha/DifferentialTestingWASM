;; Implement a block with a nested loop, where a `br` instruction inside the loop targets the block containing the loop. The test ensures the labeling and resolution correctly handle jumping out of the loop to the outer block.

(assert_invalid
  (module (func $block-loop-br (result i32)
    (block (result i32) 
      (loop 
        (br 1)
      ) 
      (i32.const 1)
    )
  ))
  "type mismatch"
)
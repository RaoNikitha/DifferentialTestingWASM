;; 4. Implement nested `blocks` with a `loop` inside, and within the `loop`, place a `br` instruction targeting the outer block. The test checks that the `br` instruction exits the `loop` and continues execution after the outer block’s `end`. This validates correct unwinding from loops to outer blocks.

(assert_invalid
  (module
    (func $nested_block_loop
      (block
        (block
          (loop
            (block 
              (br 2)
            )
          )
        )
      )
    )
  )
  "unknown label"
)
;; 6. **Test Incorrect Label Resolution in Mixed Blocks and Loops:**    - Set up an environment with interleaved blocks and loops. Skip some levels with the `br` instruction. This tests proper discrimination between block and loop labels.

(assert_invalid
  (module
    (func $incorrect-label-resolution
      (block
        (block
          (loop
            (br 2)
          )
        )
      )
    )
  )
  "type mismatch"
)
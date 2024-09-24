;; 1. **Basic `nop` in Nested Blocks**: Create a function with nested blocks, include `nop` within inner blocks, and use the `br` instruction to target a specific block level. Evaluate if incorrect `nop` placement affects the correct branching.

(assert_invalid
  (module
    (func
      (block
        (block
          (nop)
          (br 1)
        )
      )
    )
  )
  "br target out of scope"
)
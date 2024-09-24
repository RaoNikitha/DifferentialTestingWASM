;; 1. **Test for Proper Depth Handling in Nested Blocks:**    Create a nested structure of blocks where a `br` instruction targets a deeply nested label. Ensure the label index counts correctly upwards through multiple layers of nesting. Validate if the implementation correctly identifies the target label's depth without out-of-bound errors.

(assert_invalid
  (module
    (func $nested-block-depth
      (block
        (block
          (block
            (block
              (br 4)
            )
          )
        )
      )
    )
  )
  "unknown label"
)
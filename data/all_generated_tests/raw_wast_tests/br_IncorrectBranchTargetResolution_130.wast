;; 1. **Test Nested Block Labels:**    Create a nested structure of multiple `block` instructions, placing the `br` instruction to jump to a specific label index. Verify correct execution path, ensuring the label resolves to the intended outer block.

(assert_invalid
  (module
    (func $nested-block-labels
      (block
        (block
          (block
            (block
              (br 3)
            )
          )
        )
      )
    )
  )
  "label out of range"
)
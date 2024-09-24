;; 1. **Test with Deeply Nested Blocks:**    Create a program with multiple levels of nested blocks and use the `br` instruction to break out of the deepest nested block to an outer block. This will test if the label indexing handles deeply nested blocks correctly.

(assert_invalid
  (module
    (func $deeply_nested_blocks
      (block
        (block
          (block
            (block
              (br 3)
            )
          )
        )
      )
      (i32.const 0) (drop)
    )
  )
  "invalid branch target"
)
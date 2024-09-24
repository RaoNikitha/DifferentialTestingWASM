;; 4. **Test with Nested Blocks Exceeding Depth**:    Craft a deep nested block structure and use a `br_table` instruction with an index that exceeds the current depth of the control stack, verifying if both implementations handle the label lookups correctly.

(assert_invalid
  (module
    (func $nested-blocks-exceeding-depth
      (block
        (block
          (block
            (block
              (block
                (block
                  (block
                    (block
                      (br_if 10 (i32.const 1))
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)
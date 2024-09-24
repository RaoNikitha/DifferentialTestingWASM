;; 5. **Nested Block Label Handling**    - Test the `br_table` in a deeply nested block structure where label indices must be resolved correctly based on the depth of the block. This tests accurate relative label indexing within nested contexts.

(assert_invalid
  (module
    (func $nested-block-label-handling
      (block
        (block
          (block
            (block
              (block
                (block
                  (block
                    (block
                      (br_table 0 7 (i32.const 1))
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
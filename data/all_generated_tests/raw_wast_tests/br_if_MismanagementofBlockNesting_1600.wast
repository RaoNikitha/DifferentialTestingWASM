;; 1. **Test 1**: Create a deeply nested set of blocks, where each nested block increments a counter. Use a `br_if` instruction that targets a specific depth of these nested blocks to test if the correct counter value is returned. This test checks whether the label lookup correctly manages multiple nested scopes.

(assert_invalid
  (module 
    (func $deeply_nested_blocks
      (block
        (block
          (block
            (block
              (block
                (block
                  (block
                    (block
                      (block
                        (br_if 8 (i32.const 1))
                      )
                      (i32.const 1)
                    )
                    (i32.const 2)
                  )
                  (i32.const 3)
                )
                (i32.const 4)
              )
              (i32.const 5)
            )
            (i32.const 6)
          )
          (i32.const 7)
        )
        (i32.const 8)
      )
    )
  )
  "type mismatch"
)
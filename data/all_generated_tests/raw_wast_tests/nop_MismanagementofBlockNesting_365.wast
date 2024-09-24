;; 6. **Deeply Nested Empty Blocks with NOP**: Use deeply nested empty `block` instructions, each containing a `nop`. Validate that the program exits all nested blocks correctly, without altering the stack state.

(assert_invalid
  (module
    (func $deeply_nested_empty_blocks
      (block
        (block
          (block
            (block
              (block
                (block
                  (block
                    (block
                      (block
                        (block
                          (nop)
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
    )
  )
)
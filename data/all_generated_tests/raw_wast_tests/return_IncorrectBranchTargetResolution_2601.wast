;; 10. **Test Description**:    Write a function with several nested control constructs (`block`, `loop`, `if-else`) mixed with complex branching (`br_if,` `br_table,` `loop`). Place a `return` instruction deep within nested conditional blocks to test if `return` correctly jumps to the outermost block/function.    - **Specific Constraint**: Ensures that combinations of constructs do not interfere with `return`.    - **Incorrect Branch Target Resolution**: Validates accurate branch target resolution in a complex nested environment.

(assert_invalid
  (module
    (func $nested_return (result i32)
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (if (result i32) (i32.const 1)
              (then
                (br_if 0 (i32.const 0))
                (loop (result i32)
                  (block (result i32)
                    (if (result i32) (i32.const 1)
                      (then
                        (br_table 0 (return))
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
  "type mismatch"
)
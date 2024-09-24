;; 2. **Deeply Nested Blocks with Calls**: Construct a scenario with a series of deeply nested blocks, wherein certain blocks contain `call` instructions to different functions. Validate that after each function call, the control flow returns to the correct block and continues execution as expected.

(assert_invalid
  (module
    (func $nested-calls
      (block
        (block
          (block
            (block
              (call 0)
            )
            (call 1)
          )
          (call 2)
        )
        (call 3)
      )
    )
    (func (param i32))
    (func (param i32))
    (func)
  )
  "type mismatch"
)
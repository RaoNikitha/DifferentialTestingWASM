;; 1. **Test Description:**    - Create a nested block structure with a `br` instruction targeting an outer block. Ensure that the `br` instruction consumes multiple operands from the operand stack. Validate that the consumed operands match the output type of the targeted block to check for stack consistency.

(assert_invalid
  (module
    (func $nested-blocks
      (block $outer (result i32)
        (i32.const 42)
        (block $inner
          (i32.const 99)
          (i32.const 100)
          (br 1) 
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)
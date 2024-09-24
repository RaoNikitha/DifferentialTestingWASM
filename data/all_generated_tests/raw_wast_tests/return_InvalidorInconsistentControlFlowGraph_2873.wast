;; 2. **Nested Blocks Returning with Mismatched Types**:    - Create a function with nested control blocks that use the `return` instruction to exit, but with operand types mismatched from the outer block's expected return type. This will test how each implementation handles type validation during stack unwinding.

(assert_invalid
  (module
    (func $nested-blocks-mismatch (result i32)
      (block
        (block (result f64)
          (return (f64.const 1.0))
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)
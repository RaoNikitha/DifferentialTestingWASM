;; 1. Test a function with nested blocks where the `return` instruction is inside the innermost block, ensuring it correctly exits the entire function and does not mistakenly target an intermediate block.

(assert_invalid
  (module
    (func $nested_return (result i32)
      (block
        (block
          (i32.const 42)
          (return)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)
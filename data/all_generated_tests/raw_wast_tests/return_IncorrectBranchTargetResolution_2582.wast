;; 1. **Test with Nested Blocks and Mismatched Return**    - **Description**: Create a function with nested blocks and a `return` instruction placed within a nested block. Ensure the block types differ from the return type expected by the outermost block.    - **Constraint**: This test checks if the `return` incorrectly resolves to an intermediate nested block rather than the outermost block.

(assert_invalid
  (module
    (func $nested-blocks-mismatched-return (result i32)
      (block (result i64)
        (block
          (return)
          (i64.const 0)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)
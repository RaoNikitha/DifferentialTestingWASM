;; 10. **Test with Deeply Nested Block Returns**    - **Description**: Create deeply nested blocks inside a function and place a `return` instruction in the innermost block.    - **Constraint**: Ensures that the `return` instruction correctly resolves all nested blocks and unwinds back to the outermost function block.

(assert_invalid
  (module
    (func $deeply-nested-blocks (result i32)
      (block
        (block
          (block
            (block
              (return (i32.const 10))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
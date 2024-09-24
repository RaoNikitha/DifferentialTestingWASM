;; 1. **Test Description**:    Create a function with multiple nested blocks, each having its own unique label. Call the `return` instruction inside the innermost block. The test evaluates if the `return` instruction correctly targets the outermost function block, ensuring that intermediate blocks are ignored.    - **Specific Constraint**: Validates that the `return` does not mistakenly target intermediate blocks.    - **Incorrect Branch Target Resolution**: Ensures correct resolution to the function's outermost block.

(assert_invalid
  (module
    (func $nested-blocks-return
      (block (block (block (block
        (return)
      ))))
    )
  )
  "type mismatch"
)
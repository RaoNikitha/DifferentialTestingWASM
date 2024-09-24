;; 3. **Test with Deeply Nested Blocks**:    - **Description**: Embed a `call` instruction within multiple nested blocks and check if the correct function is called.    - **Constraint**: Checks for accurate branch resolution through complex nested hierarchies.    - **Relation to Incorrect Branch Target Resolution**: Errors in label resolution might cause the `call` to branch outside of its intended code block.

(assert_invalid
  (module
    (func $nested-blocks
      (block
        (block
          (block
            (call 0)
          )
        )
      )
    )
    (func)
  )
  "unknown function"
)
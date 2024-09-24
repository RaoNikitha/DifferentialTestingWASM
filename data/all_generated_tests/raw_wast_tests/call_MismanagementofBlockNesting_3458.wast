;; 7. **Function Calls within Empty Nested Blocks**:    - **Test Description**: Use a series of empty nested blocks that contain call instructions to identify if unnecessary stack operations or missing stack manipulations cause any issues.    - **Constraint Checked**: Handling of stack and arguments in structurally empty but nested blocks.    - **Relation to Mismanagement of Block Nesting**: Ensures no mismanagement in seemingly trivial nested contexts.

(assert_invalid
  (module
    (func $call-in-nested-blocks (block (block (block (call 1)))))
    (func)
  )
  "type mismatch"
)
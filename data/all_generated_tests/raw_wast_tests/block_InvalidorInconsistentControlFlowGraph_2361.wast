;; 2. **Unmatched `end` Instruction**:    - **Test Description**: Create a block with missing or extra `end` instruction within a nested block structure.    - **Reasoning**: This test looks for proper nesting enforcement and ensures that all blocks are correctly bracketed, which is critical for CFG accuracy.    - **Constraint checked**: Well-Nested Block Requirement    - **Relation to CFG**: Validates that the CFG reflects the precise structure of nested control flows.

(assert_invalid
  (module (func $unmatched-end (result i32)
    (block (result i32)
      (block (result i32)
        (i32.const 42)
      (i32.add))
      (i32.const 0)
    end)
  ))
  "unexpected end of section or function"
)
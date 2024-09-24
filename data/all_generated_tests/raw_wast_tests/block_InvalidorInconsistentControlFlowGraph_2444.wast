;; 5. **Test Deeply Nested Blocks with Branches**:    - Description: Craft deeply nested blocks with varying branches targeting different levels.    - Constraint: Verify that deeply nested structures are accurately tracked and branched.    - CFG Relevance: Complex nesting can stress test the CFG handling capacity, ensuring correct path determination.

(assert_invalid
  (module (func $deeply_nested_blocks_with_branches (block (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br 4 (i32.const 42))
          )
        )
      )
    )
  )))
  "type mismatch"
)
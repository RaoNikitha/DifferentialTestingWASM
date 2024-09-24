;; 2. **Test 2: Deeply Nested Blocks with Multiple Forward Branches**    - **Description:** Multiple blocks nested within each other with `br` instructions targeting various levels of outer blocks from within the innermost block.    - **Constraint:** Verifies branching from a deep nesting level to multiple outer blocks.    - **Mismanagement Check:** Ensures proper adjustment of label indices and stack state during branching.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block
          (block
            (br 2)
            (unreachable)
          )
          (unreachable)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)
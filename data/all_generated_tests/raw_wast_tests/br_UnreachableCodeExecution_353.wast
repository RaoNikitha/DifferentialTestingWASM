;; 4. **Test Description:**    - **Test Scenario:** Create multiple nested blocks with different labels and place an `unreachable` instruction in one of the inner blocks. Use a `br` instruction with a label index targeting an outer block.    - **Specific Constraint:** Ensure correct label indexing and relative lookup within deeply nested structures.    - **Relation to Unreachable Code Execution:** Check that the branch skips over the inner block containing the `unreachable` instruction and continues correctly after the targeted outer block.

(assert_invalid
  (module
    (func $nested-blocks
      (block
        (block
          (unreachable)
          (block (br 2))
        )
      )
    )
  )
  "unknown label"
)
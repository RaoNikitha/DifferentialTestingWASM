;; 7. **Test Description:**    - **Test Scenario:** Create nested `block` instructions with an `unreachable` instruction in an unexpected position. Use `br` to exit to an outer block.    - **Specific Constraint:** Ensure the nested block structure and correct interpretation of relative label indexing.    - **Relation to Unreachable Code Execution:** Check that the control flow is properly maintained and the `unreachable` instruction in the nested block is not executed due to the `br` instruction.

(assert_invalid
  (module
    (func
      (block
        (block
          (br 1)
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)
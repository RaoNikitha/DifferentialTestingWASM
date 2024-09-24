;; 9. **Test Description:**    - **Test Scenario:** Implement a sequence of `block` instructions where the final block contains an `unreachable` instruction, but a `br` instruction from an inner block targets an outer block.    - **Specific Constraint:** Verify the operand stack management and the relative label indexing in a sequence of nested blocks.    - **Relation to Unreachable Code Execution:** Confirm that the `br` instruction appropriately exits to the targeted block, avoiding the block containing the `unreachable` instruction.

(assert_invalid
  (module
    (func $nested-blocks
      (block $outer
        (block
          (br $outer)
        )
        (unreachable)
      )
      (nop)
    )
  )
  "type mismatch"
)
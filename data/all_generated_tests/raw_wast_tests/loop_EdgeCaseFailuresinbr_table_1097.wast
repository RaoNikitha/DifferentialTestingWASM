;; 8. **Test Description**:     Create a loop block with an immediate `br_table` instruction that has an out-of-bounds index and directly follow it with another control instruction (e.g., another loop or block). The test checks for ensuring the appropriate execution flow.    **Constraint**: Verify abrupt default branching mid-loop doesn’t disrupt subsequent instructions.    **Relation to `br_table` Edge Cases**: Ensures there are no execution pauses or skips after a default branch is chosen.

(assert_invalid
  (module
    (func
      (loop (br_table 1 1 2) (block (nop)))
    )
  )
  "unreachable"
)
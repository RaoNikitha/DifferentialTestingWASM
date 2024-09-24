;; 8. **Test Description**: Create a `br_table` instruction with redundant duplicate indices mapped to the same target in multiple places. Surround with `nop` instructions.     - **Constraint Checked**: Validate if the placement of `nop` impacts duplicate index mapping behavior.     - **Edge Case Relation**: Duplicate indices should map consistently irrespective of `nop` instructions' presence.

(assert_invalid
  (module
    (func $br_table_with_nops
      block
        br_table 0 0 0
        nop
        nop
      end
    )
  )
  "type mismatch"
)
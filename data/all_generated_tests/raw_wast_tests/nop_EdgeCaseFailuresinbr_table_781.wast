;; 2. **Test Description**: Use a `br_table` instruction with exactly one target and an index equal to the number of targets. Precede and follow this with `nop` instructions.     - **Constraint Checked**: Verify that `nop` does not influence the handling of index when it equals the target count.     - **Edge Case Relation**: Index matching target count should be handled correctly without `nop` impacting outcomes.

(assert_invalid
  (module
    (func $br_table-nop
      (block $label
        (nop)
        (br_table $label (i32.const 1))
        (nop)
      )
    )
  )
  "br_table number of targets must match number of labels"
)
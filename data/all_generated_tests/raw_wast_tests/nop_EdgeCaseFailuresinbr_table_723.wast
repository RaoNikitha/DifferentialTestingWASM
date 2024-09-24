;; 4. **Test 4: `nop` Between `br_table` With Edge Index and `unreachable`**    - Place a `nop` between a `br_table` instruction branching to an edge index and an `unreachable` instruction, testing if the `nop` interference leads to any discrepancy in execution flow.    - Constraint: Validate that hitting the `nop` still results in the edge index branch behavior being consistent and independent.

(assert_invalid
  (module
    (func (block $label_0
      (br_table $label_0 (nop))
      (unreachable)
    ))
  )
  "type mismatch"
)
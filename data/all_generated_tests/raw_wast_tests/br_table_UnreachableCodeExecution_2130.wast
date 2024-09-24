;; 10. **Over-indexed Branches**:    - Description: Use a `br_table` instruction where the operand supplied is always greater than the highest index in the label vector, aiming directly for `unreachable`.    - Constraint: Ensures proper capture and defaulting mechanism when operand indices are out of bounds.    - Relation: Improper implementation might cause control flow to go astray and reach an `unreachable` segment independently of correct boundary processing.

(assert_invalid
  (module
    (func
      (block (br_table 0 1 (i32.const 5)) (unreachable))
    )
  )
  "type mismatch"
)
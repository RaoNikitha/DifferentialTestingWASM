;; 10. **Test Case 10:** Design a scenario where a `br_table` jump lands directly on an `unreachable` instruction within a series of nested control constructs, such as blocks or loops, to check proper trap mediation at intersection points. \    _Constraint Checked: Correct mediation and execution halt at nested control points facing traps._

(assert_invalid
  (module
    (func (block (loop (block (br_table 0 1 (unreachable)))))))
  "type mismatch"
)
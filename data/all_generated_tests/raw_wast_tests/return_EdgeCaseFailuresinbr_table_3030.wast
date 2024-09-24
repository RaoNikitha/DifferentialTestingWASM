;; 9. **Multiple Identical Targets**:    - Include a `br_table` instruction where all possible targets in the vector are the same block.    - **Constraint**: Ensure no optimization or shortcut incorrectly handles identical targets.    - **Edge Case**: Maintains correct branching behavior even with redundant targets.

(assert_invalid
  (module
    (func $test (block $lbl0 (br_table $lbl0 $lbl0 $lbl0 (return))))
  )
  "type mismatch"
)
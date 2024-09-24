;; 6. **Mid-sized Switch-case Complexity**:    - Formulate a block where the `br_table` instruction acts on an index within varied mid-sized label tables. This tests the complexity of handling more frequent but not too large branching scenarios.    - **Constraint Checked**: Performance and accuracy of mid-sized `br_table` tables.

(assert_invalid
  (module (func $mid-sized-switch-case-complexity
    (block (result i32)
      (br_table 0 1 2 3 4 5 6 7 8 9 10 (i32.const 1))
      (i32.const 10)
    )
  ))
  "type mismatch"
)
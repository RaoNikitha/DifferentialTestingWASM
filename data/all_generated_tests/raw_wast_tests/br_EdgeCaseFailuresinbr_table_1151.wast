;; 2. **Test Description**: A `br_table` instruction with an index value that is one more than the highest target label index.    - **Constraint Checked**: Proper bounds-checking for indices that are slightly out of range.    - **Edge Case Relation**: Verifies if implementations gracefully handle indices that exceed the available range by one.

(assert_invalid
  (module
    (func $br_table-out-of-range
      (block (result i32)
        (br_table 0 1 (i32.const 2))
      )
    )
  )
  "invalid br_table"
)
;; 3. **Test Description**: A `br_table` instruction where the index provided is the same as the number of target labels.    - **Constraint Checked**: Correct handling at the boundary condition where the index equals the number of labels.    - **Edge Case Relation**: Important to catch off-by-one errors in bounds-checking routines.

(assert_invalid
  (module (func $off-by-one-boundary
    (block
      (block
        (br_table 1 1 (i32.const 1))
      )
    )
  ))
  "index out of bounds"
)
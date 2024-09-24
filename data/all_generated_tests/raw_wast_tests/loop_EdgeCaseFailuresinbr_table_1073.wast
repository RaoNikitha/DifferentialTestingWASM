;; 4. **`br_table` Index Just Below Lower Bound**:    - **Description**: Test a `br_table` instruction just below the valid range (e.g., -1) inside a loop.    - **Constraint**: Ensures edge case handling when the index is just outside the valid range to check for correct behavior.

(assert_invalid
  (module
    (func (loop (param i32)
      (br_table 0 -1 (i32.const 0))
    ))
  )
  "invalid br_table index"
)
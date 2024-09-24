;; 2. **`br_table` with Out-of-Bounds Index**:    - **Description**: Test a `br_table` instruction inside a loop with an index operand that is higher than the number of available targets in the table.    - **Constraint**: Verifies the correct behavior when the index is out of bounds, checking implementations' fallback to the default target.

(assert_invalid
  (module
    (func $br_table_with_out_of_bounds_index
      (i32.const 5)
      (block $label (loop (result i32) (br_table $label 1 (i32.const 0)))))
  )
  "unknown label"
)
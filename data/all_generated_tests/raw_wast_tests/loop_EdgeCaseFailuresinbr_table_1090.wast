;; 1. **Test Description**:     Create a loop block with a `br_table` instruction and provide an index that is out of bounds of the available branch targets. Verify that the loop correctly defaults to the specified default target, ensuring that label indexing and bounds-checking are properly implemented.    **Constraint**: Ensure the `br_table` instruction handles out-of-bounds indices correctly.    **Relation to `br_table` Edge Cases**: Tests correct handling when the branch index exceeds the number of specified labels.

(assert_invalid
  (module (func $br_table_out_of_bounds
    (i32.const 0) (loop (result i32)
      (i32.const 1) 
      (br_table 1) 
      end)
  ))
  "out of bounds"
)
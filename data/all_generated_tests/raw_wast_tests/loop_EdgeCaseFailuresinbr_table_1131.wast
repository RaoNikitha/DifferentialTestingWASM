;; 2. **Test Case 2**: A `br_table` instruction with an index that is out of bounds (greater than the number of loop targets).    - **Constraint**: Triggering the default target when the index exceeds the number of available jump targets.    - **Relation to br_table Edge Case**: Validates handling of out-of-bounds index by routing to the default case.

(assert_invalid
  (module (func $test_br_table_out_of_bounds
    (loop (result i32)
      (block (br_table 1 0 (i32.const 2)) (i32.const 0))
    )
  ))
  "br_table index out of bounds"
)
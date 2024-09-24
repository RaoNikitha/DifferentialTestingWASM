;; 3. **Test Description**:    - Design a `loop` where `br_table` has multiple indices, and the selected index exceeds the number of targets by one.    - **Constraint**: Tests handling of out-of-bounds branching.    - **Edge Case**: Checks for potential undefined behavior in out-of-range indices.

(assert_invalid
  (module (func $br_table_out_of_bounds
    (loop (block
      (br_table 0 1 2 3)  ;; Invalid: Index exceeds number of labels by one
    ))
  ))
  "unknown label" 
)
;; 2. **Index Out of Bounds**:    - Include a `br_table` instruction with a vector of targets, but provide an index that is higher than the number of targets.    - **Constraint**: Test the enforcement of index bounds within the `br_table`.    - **Edge Case**: The handling of out-of-bounds index leading to possible runtime errors or undefined behavior.

(assert_invalid
  (module
    (func $index-out-of-bounds-br_table
      (i32.const 1)
      (block (br_table 0 1 (return)))
    )
  )
  "type mismatch"
)
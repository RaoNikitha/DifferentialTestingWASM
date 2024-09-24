;; 2. **Test Description**: Implement a `br_table` within a nested control structure where the index falls precisely on the boundary of the table's size. The test should ensure correct branch targets.    - **Constraint**: Ensures the boundary condition is correctly managed and the branch targets to the last defined valid label.    - **Edge Case Relation**: Tests the implementation’s handling of indices that exactly match table bounds, checking if it branches appropriately.

(assert_invalid
  (module
    (func $br_table_boundary_test
      (block $outer
        (block $inner
          (i32.const 0)
          (br_table 0 1 0)
        )
      )
    )
  )
  "br_table index out of bounds"
)
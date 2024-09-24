;; 9. **Test Description**: Establish a `block` with chained `br_table` calls where the cumulative effect leads to an out-of-bounds index. This will push the limits on handling cumulative indices and test nested validations.    - **Constraint Checked**: Error handling for cumulative out-of-bounds conditions in nested branching.

(assert_invalid
  (module (func $cumulative-br_table
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br_table 0 1 2 3 4 (i32.const 5))
          )
        )
      )
    )
  ))
  "out of bounds br_table index"
)
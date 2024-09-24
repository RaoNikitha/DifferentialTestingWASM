;; 7. **Test Description**: Implement nested `blocks` where an inner block features a `br_table` that indexes beyond the outer block’s labels.    - **Constraint**: The `br_table` should correctly resolve to the default branch due to an invalid target.    - **Edge Case**: Tests cross-block indexing to default branches and correct target resolution.

(assert_invalid
  (module 
    (func 
      (block 
        (block 
          (br_table 0 1 2 (i32.const 10))
        )
        (i64.const 0)
      )
    )
  )
 "unknown label"
)
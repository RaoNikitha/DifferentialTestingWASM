;; 2. **Test 2**: Implement nested loops with a `br_table` at each level that targets different labels based on a multi-way branch. Verify that the proper label indices for both inner and outer loops are respected.    - **Constraint**: Validates correct nesting and relative label indexing.    - **Relation to Infinite Loops**: Errors in relative indexing can lead to loops not exiting as intended.

(assert_invalid
 (module
  (func
   (block
    (loop 
     (block (br_table 0 1 2 (i32.const 0)))
     (loop (br_table 0 1 (i32.const 1)))
    )
    (i32.const 0)
   )
  )
 )
 "type mismatch"
)
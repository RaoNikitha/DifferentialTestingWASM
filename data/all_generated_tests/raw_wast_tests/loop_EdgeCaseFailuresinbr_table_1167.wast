;; 8. **Test Description**:     Design a loop where the `br_table` uses a mixture of constant and variable index values, including a set of out-of-bounds constants.     - **Constraint**: Validates combined constant and variable index handling in `br_table`.     - **Edge Case**: Ensures both static and dynamic out-of-bounds indexes are properly managed.

(assert_invalid
  (module
    (func $br_table_mixed
      (local $x i32)
      (block $exit
        (loop $loop
          (i32.const 1) 
          (i32.const 100) 
          (local.get $x)
          (br_table $exit $loop $exit $loop)
        )
      )
    )
  )
  "type mismatch"
)
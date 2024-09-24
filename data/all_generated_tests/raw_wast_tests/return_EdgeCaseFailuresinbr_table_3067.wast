;; 6. **Test Description**: `br_table` with a mix of numeric and out-of-bound indices combined with intermediary operations adding to the stack before returning.    - **Constraint**: Ensures intermediate stack operations do not disrupt correct stack unwinding.

(assert_invalid
  (module
    (func $br_table-return-mixed (result i32)
      (block
        (i32.const 10)
        (br_table 0 1 (i32.const 0)) ;; br_table with in-bounds index
        (return)
      )
      (block
        (i32.const 20)
        (br_table 0 1 (i32.const 2)) ;; br_table with out-of-bounds index
        (return)
      )
    )
  )
  "type mismatch"
)
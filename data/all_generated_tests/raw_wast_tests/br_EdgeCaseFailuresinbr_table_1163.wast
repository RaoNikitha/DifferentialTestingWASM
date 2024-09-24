;; 4. **Test for Largest Possible Index Value:**    - Test `br_table` with an exceedingly large index that far exceeds the target table size (e.g., INT_MAX or UINT_MAX).      - **Constraint Checked:** Confirms proper bounds checking and error handling on extremely large index values.      - **Edge Case Insight:** Ensures robustness against possible index overflow or out-of-bounds errors.

(assert_invalid
  (module
    (func $test-br-table-large-index (block (result i32)
      (block (br_table 2147483647)) (i32.const 0)
    ))
  )
  "index out of bounds"
)
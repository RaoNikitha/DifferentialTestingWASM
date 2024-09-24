;; 3. **Test Description**:     Implement a loop where `br_table` references an immediately preceding label with an index that precisely matches the number of targets.     - **Constraint**: Checks if `br_table` correctly handles boundary index values.     - **Edge Case**: Ensures that indexes exactly matching target counts are properly managed.

(assert_invalid
  (module 
    (func $loop-br_table 
      (loop (br_table 0 0 (i32.const 0)))))
  "br_table target index out of bounds"
)
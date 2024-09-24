;; 4. **Test Description**:    - Implement a loop with a `br_table` that contains negative index values.    - Verify if the implementation handles invalid negative indices gracefully.    - This tests for the proper validation and handling of negative indices.    -

(assert_invalid
  (module (func $br_table-negative-index
    (block (loop (br_table -1 0 1 2 (i32.const 0))))
  ))
  "type mismatch"
)
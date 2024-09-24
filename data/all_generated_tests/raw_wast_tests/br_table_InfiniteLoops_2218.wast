;; 8. **Immediate Encoding Errors**:    - Introduce intentional errors in the immediate encoding of `br_table`, such as incorrect lengths or misallocated labels. This test confirms if the engine properly detects and handles immediate encoding errors, avoiding infinite control flow loops due to wrong label indexing.

(assert_invalid
  (module (func
    (block (br_table 0 1 2 (i32.const 0)))
  ))
  "out of bounds label"
)
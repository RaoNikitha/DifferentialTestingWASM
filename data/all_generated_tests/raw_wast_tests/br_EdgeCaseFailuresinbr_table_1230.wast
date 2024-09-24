;; - Test 1: Check if `br_table` implementation properly handles an index that is exactly equal to the number of available targets. This edge case tests if the `br_table` strictly adheres to zero-based indexing.

(assert_invalid
  (module (func $test_br_table_edge_index
    (block
      (loop (br_table 0 0 1 (i32.const 2)) (nop))
    )
  ))
  "unknown label"
)
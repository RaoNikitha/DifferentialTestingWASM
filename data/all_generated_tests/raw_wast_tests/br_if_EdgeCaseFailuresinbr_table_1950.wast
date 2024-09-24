;; Test 1: Check a `br_table` with an index that is exactly on the boundary between valid and invalid targets. This tests how the out-of-bounds index is handled by different implementations, ensuring proper reference handling.

(assert_invalid
  (module
    (func
      (block (br_if 0) (br_table 0 1 (i32.const 2)))
    )
  )
  "unknown label"
)
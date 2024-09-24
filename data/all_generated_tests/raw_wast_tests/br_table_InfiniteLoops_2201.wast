;; 1. **Test Description:** Create a test where `br_table` is used within a simple loop with an out-of-bounds index to verify if `br_table` correctly defaults to the specified target label and does not cause an infinite loop.

(assert_invalid
  (module
    (func (loop (br_table 0 (i32.const 42)) (br 1)))
  )
  "unknown label"
)
;; Test a `br_table` inside a block with an index that exceeds the number of available targets. This can check if both implementations properly handle the out-of-bounds index condition. Specifically, it tests whether the index handling is robust and consistent between `check_block_type` and `parser.readBlockType`.

(assert_invalid
  (module
    (func $block_br_table_out_of_bounds
      (block (loop
        (br_table 1 1 (i32.const 0))
      ))
    )
  )
  "unknown label"
)
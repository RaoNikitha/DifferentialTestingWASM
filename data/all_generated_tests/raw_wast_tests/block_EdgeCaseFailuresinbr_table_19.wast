;; 10. Deploy a `br_table` where indices cyclically refer to valid targets but end on an invalid index, testing whether each engine correctly restores or maintains stack consistency post-failure within a block.

(assert_invalid
  (module
    (func $test (result i32)
      (block (result i32)
        (block (br_table 0 1 2 (i32.const 0) (i32.const 1)))
      )
    )
  )
  "type mismatch"
)
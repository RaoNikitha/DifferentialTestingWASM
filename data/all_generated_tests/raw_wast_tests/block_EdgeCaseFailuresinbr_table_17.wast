;; 8. Construct a `br_table` with indices oscillating between valid and invalid ranges within a deeply nested block, observing how varying block depths influence out-of-bound index management.

(assert_invalid
  (module
    (func $br_table_block_test
      (block $outer (result i32)
        (block $mid (result i32)
          (block $inner (result i32)
            (br_table 0 1 2 (i32.const 0))
          )
        )
      )
      (i32.const 0)
    )
  )
  "invalid block index"
)
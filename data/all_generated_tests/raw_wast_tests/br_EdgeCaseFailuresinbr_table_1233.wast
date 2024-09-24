;; - Test 4: Invoke `br_table` with the maximum possible integer value as an index. This test will push the limits of index bounds checking to ensure the implementation does not exhibit integer overflow or out-of-bounds access.

(assert_invalid
  (module
    (func $test-br_table-max-index
      (block
        (br_table 0 2147483647 (i32.const 0))
      )
    )
  )
  "undefined label"
)
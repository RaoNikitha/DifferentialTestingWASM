;; Test 1: Craft a `br_table` instruction with an index that is exactly equal to the number of available targets. This test checks whether the implementation correctly handles an edge case where the index points to just beyond the last valid target.

(assert_invalid
  (module
    (func
      (block
        (block
          (br_table 0 1 (i32.const 1) (i32.const 2))
        )
      )
    )
  )
  "invalid target index"
)
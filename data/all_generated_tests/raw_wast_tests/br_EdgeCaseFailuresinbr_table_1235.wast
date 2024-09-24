;; - Test 6: Feed the `br_table` with an index of zero in a structure with no predefined labels. This scenario tests if the implementation gracefully handles cases with zero available targets.

(assert_invalid
  (module
    (func
      (block
        (br_table 0 (i32.const 0))
      )
    )
  )
  "undefined label"
)
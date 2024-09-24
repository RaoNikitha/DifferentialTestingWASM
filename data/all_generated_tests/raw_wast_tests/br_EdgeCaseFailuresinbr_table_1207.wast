;; 8. Create a `br_table` which includes a target index that exceeds the number of entries but within the range of possible indices. This ensures label indices are correctly interpreted relatively within deeply nested structures.

(assert_invalid
  (module
    (func $nested-br-table
      (block
        (block
          (block
            (br_table 0 1 2 (i32.const 3))
          )
        )
      )
    )
  )
  "unknown label"
)
;; 1. **Test Description**: Create a `br_table` instruction with an index that exceeds the available table size by 1, expecting it to fall back to a default branch. This tests if the implementation correctly handles out-of-bound indices by using the default branch.

(assert_invalid
  (module
    (func $default_case (param i32))
    (table funcref (elem $default_case))
    (func $exceeding_br_table
      (i32.const 1)
      (br_table 0 1
        (call $default_case)
      )
    )
  )
  "index out of bounds"
)
;; 7. **Test Description**: A `br_table` with overlapping labels, where misinterpreted relative indexing could lead to an unexpected default branch, directing to an `unreachable` instruction, to test label indexing accuracy.

(assert_invalid
  (module
    (func
      (block
        (block (br_table 0 1 0 (i32.const 2)))
        (unreachable)
      )
      (i32.const 0)
    )
  )
  "unknown label"
)
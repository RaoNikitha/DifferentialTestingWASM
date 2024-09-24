;; 5. Verify a `br_table` instruction with mixed index values, where some indices are valid and others are out of bounds, ensuring only valid indices are used and detecting errors appropriately. This checks for mixed valid and invalid index handling.

(assert_invalid
  (module (func $mixed-index-values
    (block (br_table 0 0x10000001 1 2 0 (i32.const 3)))
  ))
  "unknown label"
)
;; 1. Test a `br_table` instruction with an index equal to the total number of targets, which should result in an out-of-bounds check that must trigger a default case or error. This test focuses on the edge of valid target indices.

(assert_invalid
  (module (func $br_table-out-of-bounds
    (block
      (br_table 0 0 (i32.const 2))
    )
  ))
  "unknown label"
)
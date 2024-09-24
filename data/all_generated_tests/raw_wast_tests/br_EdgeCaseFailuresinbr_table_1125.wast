;; Test 6: Test a `br_table` instruction where the target table has a mix of valid and invalid indices, ensuring the index used points to the last valid target. This evaluates the handling of edge cases where the index is on the boundary between valid and invalid entries.

(assert_invalid
  (module (func $br_table-mix-valid-invalid
    (block (result i32)
      (i32.const -1)
      (block (br_table 1 2 3 0))
    )
  ))
  "unknown label"
)
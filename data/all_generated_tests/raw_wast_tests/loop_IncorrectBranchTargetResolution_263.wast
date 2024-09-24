;; 4. **Indirect Branch Table with Misindexed Targets**:    Use a `br_table` instruction within a loop pointing to various labels. Include an index that does not correspond to any valid label, checking if the engine correctly resolves the table and handles out-of-bounds indices.

(assert_invalid
  (module (func $indirect-branch-table-misindexed
    (block
      (loop (result i32)
        (i32.const 0)
        (br_table 0 1 2 99)
      )
    )
  ))
  "unknown label"
)
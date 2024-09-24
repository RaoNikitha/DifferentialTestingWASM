;; 3. Use a `br_table` where some branch targets are valid, and others would normally be unreachable due to an `unreachable` instruction. This ensures that both edge cases (valid and unreachable targets) result in a consistent trap.

(assert_invalid
  (module (func $br_table_unreachable
    (block
      (block
        (br_table 0 1 (unreachable))
      )
    )
  ))
  "type mismatch"
)
;; 8. Structure a `br_table` instruction among nested blocks where some labels refer to sibling blocks. Ensure the operand points to a sibling block to validate cross-references within nested structures.

(assert_invalid
  (module
    (func
      (block (block (br_table 1 1 (i32.const 0))))
    )
  )
  "unknown label"
)
;; 8. Formulate a test with a `br_table` inside a `block` structure, where labels are valid but the indexing operand is corrupt. Set the default to an `unreachable` instruction to detect if misindexing causes the control flow to reach unintended block locations.

(assert_invalid
  (module (func $corrupt-index
    (block (br_table 0 1 (i32.const -1)) (unreachable))
  ))
  "unknown label"
)
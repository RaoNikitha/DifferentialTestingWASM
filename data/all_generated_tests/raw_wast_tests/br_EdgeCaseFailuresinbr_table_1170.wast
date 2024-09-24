;; 1. Test with a `br_table` instruction where the provided index is exactly on the boundary of the available target labels. This ensures that the implementation properly handles edge values without undefined behavior.

(assert_invalid
  (module (func
    (block (block (br_table 0 1 (i32.const 1))))
  ))
  "unknown label"
)
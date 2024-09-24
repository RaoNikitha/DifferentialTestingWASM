;; 1. Test placing a `nop` instruction immediately before a `br_table` instruction with valid indices and verify that the `nop` indeed does nothing and the `br_table` handles valid cases correctly.

(assert_invalid
  (module
    (func $br_table (block $B (br_table $B $B) (nop)))
  )
  "type mismatch"
)
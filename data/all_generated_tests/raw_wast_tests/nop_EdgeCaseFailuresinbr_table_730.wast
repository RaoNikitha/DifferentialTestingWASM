;; 1. Test a `br_table` instruction with a negative index, then immediately follow it with a `nop`. This will check if `nop` affects how out-of-bounds indices are handled in `br_table`.

(assert_invalid
  (module
    (func (block (br_table -1 (nop))))
  )
  "br_table index out of bounds"
)
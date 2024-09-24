;; 1. Test Description 1: Generate a `br_table` instruction where the operand type on the stack does not match the type required by any of the target labels.

(assert_invalid
  (module (func (block (br_table 0 1 (i64.const 1)))))
  "type mismatch"
)
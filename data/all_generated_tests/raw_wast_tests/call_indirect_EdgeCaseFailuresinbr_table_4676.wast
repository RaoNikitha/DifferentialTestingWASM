;; 5. A `br_table` instruction where the index operand equals the number of labels. This will test if edge bounds are handled correctly, ensuring the last index is out of bounds and leads to a trap.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func))
    (table funcref (elem 0))
    (func (call_indirect (type 1) (i32.const 0)))
    (func (br_table 1 1 (i32.const 1)))
  )
  "type mismatch"
)
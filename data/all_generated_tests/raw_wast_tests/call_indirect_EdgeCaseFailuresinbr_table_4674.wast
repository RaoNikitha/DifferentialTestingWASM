;; 3. A `br_table` instruction where the index operand is the maximum 32-bit integer value. This will test for proper boundary handling and trapping behavior in the face of extreme operand values.

(assert_invalid
  (module
    (type (func (param i32 result i32)))
    (table 1 funcref)
    (func (result i32)
      (call_indirect (type 0) (i32.const 2147483647))
    )
  )
  "index out of bounds"
)
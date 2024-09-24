;; 5. **Maximum Index Value**:    Use an index value that is the maximum possible `i32` value to ensure the `br_table` instruction handles large values correctly and traps if out of bounds.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 funcref)
    (func $max-index
      (call_indirect (type 0) (i32.const 2147483647))
    )
  )
  "out of bounds"
)
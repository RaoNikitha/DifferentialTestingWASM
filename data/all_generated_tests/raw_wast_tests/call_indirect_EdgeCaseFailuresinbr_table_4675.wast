;; 4. Use `br_table` with a table that has labels, and an index operand that is a negative number, which should test if implementations correctly trap due to invalid negative index values.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 10 funcref)
    (func $invalid_index
      (br_table 0 1 2 (i32.const -1))
    )
  )
  "invalid negative index value"
)
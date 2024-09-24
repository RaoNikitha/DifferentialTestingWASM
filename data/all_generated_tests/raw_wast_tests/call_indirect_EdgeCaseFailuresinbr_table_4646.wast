;; 5. Use `call_indirect` with an index exactly equal to the table size within `br_table`, to verify proper boundary checking.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $index-equals-table-size
      (br_table 0 (call_indirect (type 0) (i32.const 1) (i32.const 0)))
    )
  )
  "type mismatch"
)
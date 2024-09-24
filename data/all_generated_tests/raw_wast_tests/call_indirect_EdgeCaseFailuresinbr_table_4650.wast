;; 9. Test `call_indirect` pointing to a `br_table` using an invalid table index (greater than available tables), to observe if the proper error handling mechanism triggers.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $invalid-table-index
      (call_indirect (type 0) (i32.const 0) (i32.const 10))
    )
  )
  "index out of bounds"
)
;; 2. Test a `call_indirect` instruction where an indirect call is made with an index that is exactly on the boundary of the table's valid range to check if both implementations properly handle edge boundary conditions.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $boundary-test
      (call_indirect (type 0) (i32.const 1))
    )
  )
  "type mismatch"
)
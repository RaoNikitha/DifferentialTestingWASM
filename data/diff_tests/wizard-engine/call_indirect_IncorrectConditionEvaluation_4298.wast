;; 7. Assess the handling of `call_indirect` when the provided table index points to non-`funcref` type entries, ensuring that the implementations accurately enforce table type constraints.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 externref)
    (func $type-table-non-funcref (call_indirect (type 0) (i32.const 0) (i32.const 0)))
  )
  "type mismatch"
)
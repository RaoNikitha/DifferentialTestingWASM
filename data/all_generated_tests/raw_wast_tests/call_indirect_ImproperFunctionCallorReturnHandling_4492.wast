;; 1. Test a `call_indirect` instruction where the table index is valid but the function type doesn't match the expected type, to check if both implementations properly trap when a type mismatch occurs during the dynamic function resolution.

(assert_invalid
  (module
    (type $expected (func (param i32)))
    (type $mismatched (func (param f64)))
    (table 1 funcref)
    (elem (i32.const 0) $mismatched)
    (func (param i32)
      (call_indirect (type $expected) (i32.const 0) (local.get 0))
    )
  )
  "type mismatch"
)
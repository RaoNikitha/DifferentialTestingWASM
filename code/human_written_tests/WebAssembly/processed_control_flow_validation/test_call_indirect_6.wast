(assert_malformed
  (module quote
    "(table 0 funcref)"
    "(func (result i32)"
    "  (call_indirect (result i32) (param i32) (i32.const 0) (i32.const 0))"
    ")"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(table 0 funcref)"
    "(func (call_indirect (param $x i32) (i32.const 0) (i32.const 0)))"
  )
  "unexpected token"
)
(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0)"
    "  (if (type $sig) (result i32) (param i32) (i32.const 1) (then))"
    ")"
  )
  "unexpected token"
)
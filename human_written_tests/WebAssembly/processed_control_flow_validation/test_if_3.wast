(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0)"
    "  (if (param i32) (result i32) (type $sig) (i32.const 1) (then))"
    ")"
  )
  "unexpected token"
)
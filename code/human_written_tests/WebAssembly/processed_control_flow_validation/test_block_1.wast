(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0) (block (type $sig) (result i32) (param i32)))"
  )
  "unexpected token"
)
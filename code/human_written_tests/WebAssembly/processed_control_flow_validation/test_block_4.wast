(assert_malformed
  (module quote
    "(type $sig (func (param i32) (result i32)))"
    "(func (i32.const 0) (block (result i32) (type $sig) (param i32)))"
  )
  "unexpected token"
)
(assert_malformed
  (module quote "(func (param i32) (result i32) (block (param $x i32)))")
  "unexpected token"
)
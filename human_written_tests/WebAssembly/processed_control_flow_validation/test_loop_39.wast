(assert_malformed
  (module quote "(func (param i32) (result i32) loop (param $x i32) end)")
  "unexpected token"
)
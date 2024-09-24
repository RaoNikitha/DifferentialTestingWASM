(assert_malformed
  (module quote "(func (param i32) (result i32) if (param $x i32) end)")
  "unexpected token"
)
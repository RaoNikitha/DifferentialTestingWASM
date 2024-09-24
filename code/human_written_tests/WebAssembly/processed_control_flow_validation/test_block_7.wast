(assert_malformed
  (module quote "(func (i32.const 0) (block (param $x i32) (drop)))")
  "unexpected token"
)
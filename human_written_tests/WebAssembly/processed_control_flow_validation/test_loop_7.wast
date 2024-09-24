(assert_malformed
  (module quote "(func (i32.const 0) (loop (param $x i32) (drop)))")
  "unexpected token"
)
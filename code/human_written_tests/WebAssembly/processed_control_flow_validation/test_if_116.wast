(assert_malformed
  (module quote "(func (if i32.const 0 (then) (else)))")
  "unexpected token"
)
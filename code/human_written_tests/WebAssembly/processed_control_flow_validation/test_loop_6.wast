(assert_malformed
  (module quote
    "(func (i32.const 0) (loop (result i32) (param i32)))"
  )
  "unexpected token"
)
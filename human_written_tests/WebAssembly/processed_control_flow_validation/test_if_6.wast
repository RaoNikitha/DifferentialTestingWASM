(assert_malformed
  (module quote
    "(func (i32.const 0) (if (result i32) (param i32) (i32.const 1) (then)))"
  )
  "unexpected token"
)
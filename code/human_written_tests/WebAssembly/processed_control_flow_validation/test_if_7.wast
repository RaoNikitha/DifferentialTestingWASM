(assert_malformed
  (module quote
    "(func (i32.const 0) (i32.const 1)"
    "  (if (param $x i32) (then (drop)) (else (drop)))"
    ")"
  )
  "unexpected token"
)
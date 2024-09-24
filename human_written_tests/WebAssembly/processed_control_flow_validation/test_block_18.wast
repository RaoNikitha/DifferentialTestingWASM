(assert_invalid
  (module (func $type-value-i64-vs-void
    (block (i64.const 1))
  ))
  "type mismatch"
)
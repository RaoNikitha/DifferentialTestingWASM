(assert_invalid
  (module (func $type-value-void-vs-i64 (result i64)
    (block (result i64) (nop))
  ))
  "type mismatch"
)
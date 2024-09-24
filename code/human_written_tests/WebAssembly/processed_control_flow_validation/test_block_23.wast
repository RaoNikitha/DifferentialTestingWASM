(assert_invalid
  (module (func $type-value-empty-vs-i64 (result i64)
    (block (result i64))
  ))
  "type mismatch"
)
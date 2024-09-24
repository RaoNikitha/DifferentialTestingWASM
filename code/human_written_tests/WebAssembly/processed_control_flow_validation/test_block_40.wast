(assert_invalid
  (module (func $type-value-i64-vs-f64 (result i64)
    (block (result i64) (f64.const 0.0))
  ))
  "type mismatch"
)
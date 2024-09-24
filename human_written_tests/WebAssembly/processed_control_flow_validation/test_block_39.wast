(assert_invalid
  (module (func $type-value-i64-vs-f32 (result i64)
    (block (result i64) (f32.const 0.0))
  ))
  "type mismatch"
)
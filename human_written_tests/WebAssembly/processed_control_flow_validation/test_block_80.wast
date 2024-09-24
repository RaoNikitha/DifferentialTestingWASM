(assert_invalid
  (module (func $type-break-i64-vs-f32 (result i64)
    (block (result i64) (br 0 (f32.const 1.0)) (i64.const 1))
  ))
  "type mismatch"
)
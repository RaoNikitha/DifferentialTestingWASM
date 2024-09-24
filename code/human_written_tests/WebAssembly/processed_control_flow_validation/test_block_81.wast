(assert_invalid
  (module (func $type-break-i64-vs-f64 (result i64)
    (block (result i64) (br 0 (f64.const 1.0)) (i64.const 1))
  ))
  "type mismatch"
)
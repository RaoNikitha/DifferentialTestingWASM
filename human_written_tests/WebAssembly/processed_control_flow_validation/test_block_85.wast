(assert_invalid
  (module (func $type-break-f64-vs-i32 (result f64)
    (block (result i64) (br 0 (i32.const 1)) (f64.const 1.0))
  ))
  "type mismatch"
)
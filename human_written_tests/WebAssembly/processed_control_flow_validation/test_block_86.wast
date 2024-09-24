(assert_invalid
  (module (func $type-break-f64-vs-i64 (result f64)
    (block (result f64) (br 0 (i64.const 1)) (f64.const 1.0))
  ))
  "type mismatch"
)
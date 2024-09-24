(assert_invalid
  (module (func $type-value-f64-vs-i64 (result f64)
    (block (result f64) (i64.const 0))
  ))
  "type mismatch"
)
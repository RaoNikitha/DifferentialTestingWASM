(assert_invalid
  (module (func $type-break-nested-f64-vs-i64 (result f64)
    (block (result f64)
      (block (result f64) (br 1 (i64.const 1))) (br 0 (f64.const 1.0))
    )
  ))
  "type mismatch"
)
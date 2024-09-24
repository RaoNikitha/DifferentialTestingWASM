(assert_invalid
  (module (func $type-break-operand-i64-vs-f64 (result i64)
    (f64.floor (block (br 0 (f64.const 9.0))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-i32-vs-f64 (result i32)
    (f64.floor (block (br 0 (f64.const 9.0))))
  ))
  "type mismatch"
)
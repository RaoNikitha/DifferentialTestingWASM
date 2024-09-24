(assert_invalid
  (module (func $type-break-operand-f32-vs-f64 (result f32)
    (f64.floor (block (br 0 (f64.const 9.0))))
  ))
  "type mismatch"
)
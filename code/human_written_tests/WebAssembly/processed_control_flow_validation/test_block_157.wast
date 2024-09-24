(assert_invalid
  (module (func $type-break-operand-f64-vs-f32 (result f64)
    (f32.floor (block (br 0 (f32.const 9.0))))
  ))
  "type mismatch"
)
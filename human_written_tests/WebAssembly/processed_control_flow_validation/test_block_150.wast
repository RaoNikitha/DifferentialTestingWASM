(assert_invalid
  (module (func $type-break-operand-i64-vs-f32 (result i64)
    (f32.floor (block (br 0 (f32.const 9.0))))
  ))
  "type mismatch"
)
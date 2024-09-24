(assert_invalid
  (module (func $type-break-operand-i32-vs-f32 (result i32)
    (f32.floor (block (br 0 (f32.const 9.0))))
  ))
  "type mismatch"
)
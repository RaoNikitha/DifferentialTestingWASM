(assert_invalid
  (module (func $type-break-operand-void-vs-f32 (result f32)
    (f32.floor (block (br 0 (nop))))
  ))
  "type mismatch"
)
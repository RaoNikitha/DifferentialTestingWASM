(assert_invalid
  (module (func $type-break-void-vs-f32 (result f32)
    (block (result f32) (br 0 (nop)) (f32.const 1.0))
  ))
  "type mismatch"
)
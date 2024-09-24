(assert_invalid
  (module (func $type-break-first-void-vs-f32 (result f32)
    (block (result f32) (br 0 (nop)) (br 0 (f32.const 1.0)))
  ))
  "type mismatch"
)
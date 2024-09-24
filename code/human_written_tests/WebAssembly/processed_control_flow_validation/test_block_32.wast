(assert_invalid
  (module (func $type-value-void-vs-f32 (result f32)
    (block (result f32) (nop))
  ))
  "type mismatch"
)
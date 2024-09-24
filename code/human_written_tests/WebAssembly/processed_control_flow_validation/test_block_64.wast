(assert_invalid
  (module (func $type-break-last-void-vs-f32 (result f32)
    (block (result f32) (br 0))
  ))
  "type mismatch"
)
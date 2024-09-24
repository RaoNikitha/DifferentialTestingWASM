(assert_invalid
  (module (func $type-value-empty-vs-f32 (result f32)
    (block (result f32))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-empty-f32 (result f32) (loop)))
  "type mismatch"
)
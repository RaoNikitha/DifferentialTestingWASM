(assert_invalid
  (module (func $type-f32 (result f32) (nop)))
  "type mismatch"
)
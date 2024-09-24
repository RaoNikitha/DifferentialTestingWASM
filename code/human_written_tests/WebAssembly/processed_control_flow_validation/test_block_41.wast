(assert_invalid
  (module (func $type-value-f32-vs-i32 (result f32)
    (block (result f32) (i32.const 0))
  ))
  "type mismatch"
)
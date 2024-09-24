(assert_invalid
  (module (func $type-value-f32-vs-i64 (result f32)
    (block (result f32) (i64.const 0))
  ))
  "type mismatch"
)
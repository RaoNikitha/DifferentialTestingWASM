(assert_invalid
  (module (func $type-break-f32-vs-i64 (result f32)
    (block (result f32) (br 0 (i64.const 1)) (f32.const 1.0))
  ))
  "type mismatch"
)
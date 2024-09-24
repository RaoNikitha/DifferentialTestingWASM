(assert_invalid
  (module (func $type-value-f32-vs-f64 (result f32)
    (block (result f32) (f64.const 0.0))
  ))
  "type mismatch"
)
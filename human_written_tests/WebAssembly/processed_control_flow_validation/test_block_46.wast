(assert_invalid
  (module (func $type-value-f64-vs-f32 (result f32)
    (block (result f64) (f32.const 0.0))
  ))
  "type mismatch"
)
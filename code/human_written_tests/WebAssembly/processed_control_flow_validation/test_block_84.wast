(assert_invalid
  (module (func $type-break-f32-vs-f64 (result f32)
    (block (result f32) (br 0 (f64.const 1.0)) (f32.const 1.0))
  ))
  "type mismatch"
)
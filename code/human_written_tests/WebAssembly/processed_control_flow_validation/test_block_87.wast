(assert_invalid
  (module (func $type-break-f64-vs-f32 (result f64)
    (block (result f64) (br 0 (f32.const 1.0)) (f64.const 1))
  ))
  "type mismatch"
)
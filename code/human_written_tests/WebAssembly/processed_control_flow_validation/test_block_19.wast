(assert_invalid
  (module (func $type-value-f32-vs-void
    (block (f32.const 1.0))
  ))
  "type mismatch"
)
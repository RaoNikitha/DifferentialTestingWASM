(assert_invalid
  (module (func $type-value-i32-vs-f32 (result i32)
    (block (result i32) (f32.const 0.0))
  ))
  "type mismatch"
)
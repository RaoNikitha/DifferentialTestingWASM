(assert_invalid
  (module (func $type-break-i32-vs-f32 (result i32)
    (block (result i32) (br 0 (f32.const 1.0)) (i32.const 1))
  ))
  "type mismatch"
)
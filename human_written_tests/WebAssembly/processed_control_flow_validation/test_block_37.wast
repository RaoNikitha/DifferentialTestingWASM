(assert_invalid
  (module (func $type-value-i32-vs-f64 (result i32)
    (block (result i32) (f64.const 0.0))
  ))
  "type mismatch"
)
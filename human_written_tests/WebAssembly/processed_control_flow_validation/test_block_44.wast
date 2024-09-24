(assert_invalid
  (module (func $type-value-f64-vs-i32 (result f64)
    (block (result f64) (i32.const 0))
  ))
  "type mismatch"
)
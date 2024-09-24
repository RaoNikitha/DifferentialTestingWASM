(assert_invalid
  (module (func $type-value-void-vs-f64 (result f64)
    (block (result f64) (nop))
  ))
  "type mismatch"
)
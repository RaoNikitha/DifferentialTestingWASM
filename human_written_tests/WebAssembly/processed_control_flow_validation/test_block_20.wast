(assert_invalid
  (module (func $type-value-f64-vs-void
    (block (f64.const 1.0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-empty-vs-f64 (result f64)
    (block (result f64))
  ))
  "type mismatch"
)
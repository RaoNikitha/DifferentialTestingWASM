(assert_invalid
  (module (func $type-value-void-vs-num (result f64) (return (nop))))
  "type mismatch"
)
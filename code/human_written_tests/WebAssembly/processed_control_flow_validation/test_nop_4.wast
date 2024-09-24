(assert_invalid
  (module (func $type-f64 (result f64) (nop)))
  "type mismatch"
)
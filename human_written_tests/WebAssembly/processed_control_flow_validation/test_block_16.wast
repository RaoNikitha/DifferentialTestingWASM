(assert_invalid
  (module (func $type-empty-f64 (result f64) (block)))
  "type mismatch"
)
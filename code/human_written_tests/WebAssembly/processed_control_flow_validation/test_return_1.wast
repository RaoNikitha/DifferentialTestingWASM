(assert_invalid
  (module (func $type-value-empty-vs-num (result i32) (return)))
  "type mismatch"
)
(assert_invalid
  (module (func $type-empty-i64 (result i64) (block)))
  "type mismatch"
)
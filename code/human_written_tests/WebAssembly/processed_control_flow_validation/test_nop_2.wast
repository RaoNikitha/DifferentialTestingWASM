(assert_invalid
  (module (func $type-i64 (result i64) (nop)))
  "type mismatch"
)
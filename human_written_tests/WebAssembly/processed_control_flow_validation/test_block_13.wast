(assert_invalid
  (module (func $type-empty-i32 (result i32) (block)))
  "type mismatch"
)
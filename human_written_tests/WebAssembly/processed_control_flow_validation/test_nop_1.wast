(assert_invalid
  (module (func $type-i32 (result i32) (nop)))
  "type mismatch"
)
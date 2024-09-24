(assert_invalid
  (module (func $type-value-empty-vs-i32 (result i32)
    (block (result i32))
  ))
  "type mismatch"
)
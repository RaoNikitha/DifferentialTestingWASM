(assert_invalid
  (module (func $type-value-empty-vs-nums (result i32 i32)
    (block (result i32 i32))
  ))
  "type mismatch"
)
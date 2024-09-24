(assert_invalid
  (module (func $type-value-empty-vs-nums (result i32 i32)
    (loop (result i32 i32))
  ))
  "type mismatch"
)
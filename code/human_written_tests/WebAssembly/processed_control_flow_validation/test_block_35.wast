(assert_invalid
  (module (func $type-value-i32-vs-i64 (result i32)
    (block (result i32) (i64.const 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-i64-vs-i32 (result i64)
    (block (result i64) (i32.const 0))
  ))
  "type mismatch"
)
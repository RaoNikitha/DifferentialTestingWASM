(assert_invalid
  (module (func $type-break-i64-vs-i32 (result i64)
    (block (result i64) (br 0 (i32.const 1)) (i64.const 1))
  ))
  "type mismatch"
)
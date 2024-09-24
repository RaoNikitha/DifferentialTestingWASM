(assert_invalid
  (module (func $type-break-last-void-vs-i64 (result i64)
    (block (result i64) (br 0))
  ))
  "type mismatch"
)
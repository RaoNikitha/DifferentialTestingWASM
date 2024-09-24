(assert_invalid
  (module (func $type-break-void-vs-i64 (result i64)
    (block (result i64) (br 0 (nop)) (i64.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-first-void-vs-i64 (result i64)
    (block (result i64) (br 0 (nop)) (br 0 (i64.const 1)))
  ))
  "type mismatch"
)
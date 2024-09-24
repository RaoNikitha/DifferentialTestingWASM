(assert_invalid
  (module (func $type-break-nested-i64-vs-void
    (block (result i64) (block (result i64) (br 1 (i64.const 1))) (br 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-nested-empty-vs-i64 (result i64)
    (block (result i64) (block (br 1)) (br 0 (i64.const 1)))
  ))
  "type mismatch"
)
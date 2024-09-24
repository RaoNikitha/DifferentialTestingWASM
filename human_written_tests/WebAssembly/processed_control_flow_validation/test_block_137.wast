(assert_invalid
  (module (func $type-break-operand-empty-vs-i64 (result i64)
    (i64.ctz (block (br 0)))
  ))
  "type mismatch"
)
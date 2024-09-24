(assert_invalid
  (module (func $type-break-operand-void-vs-i64 (result i64)
    (i64.ctz (block (br 0 (nop))))
  ))
  "type mismatch"
)
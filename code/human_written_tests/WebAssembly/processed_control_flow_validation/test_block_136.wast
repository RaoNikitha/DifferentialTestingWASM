(assert_invalid
  (module (func $type-break-operand-empty-vs-i32 (result i32)
    (i32.ctz (block (br 0)))
  ))
  "type mismatch"
)
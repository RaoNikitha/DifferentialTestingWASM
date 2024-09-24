(assert_invalid
  (module (func $type-break-operand-void-vs-i32 (result i32)
    (i32.ctz (block (br 0 (nop))))
  ))
  "type mismatch"
)
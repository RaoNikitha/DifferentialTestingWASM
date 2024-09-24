(assert_invalid
  (module (func $type-break-operand-void-vs-nums (result i32)
    (i32.add (block (br 0 (nop))))
  ))
  "type mismatch"
)
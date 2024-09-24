(assert_invalid
  (module (func $type-break-operand-empty-vs-nums (result i32)
    (i32.add (block (br 0)))
  ))
  "type mismatch"
)
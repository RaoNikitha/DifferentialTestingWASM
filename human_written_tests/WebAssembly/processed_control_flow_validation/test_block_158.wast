(assert_invalid
  (module (func $type-break-operand-num-vs-nums (result i32)
    (i32.add (block (br 0 (i64.const 9) (i32.const 10))))
  ))
  "type mismatch"
)
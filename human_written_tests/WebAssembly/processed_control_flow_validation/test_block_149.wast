(assert_invalid
  (module (func $type-break-operand-i64-vs-i32 (result i64)
    (i32.ctz (block (br 0 (i32.const 9))))
  ))
  "type mismatch"
)
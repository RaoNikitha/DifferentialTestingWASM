(assert_invalid
  (module (func $type-break-operand-f32-vs-i64 (result f32)
    (i64.ctz (block (br 0 (i64.const 9))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-break-operand-f32-vs-i32 (result f32)
    (i32.ctz (block (br 0 (i32.const 9))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-num-vs-nums (result i32 i32)
    (loop (result i32 i32) (i32.const 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-void-vs-nums (result i32 i32)
    (loop (result i32 i32) (nop))
  ))
  "type mismatch"
)
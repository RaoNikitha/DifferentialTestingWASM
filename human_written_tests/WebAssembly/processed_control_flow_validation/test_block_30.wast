(assert_invalid
  (module (func $type-value-void-vs-i32 (result i32)
    (block (result i32) (nop))
  ))
  "type mismatch"
)
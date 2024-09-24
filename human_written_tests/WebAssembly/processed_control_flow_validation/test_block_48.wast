(assert_invalid
  (module (func $type-value-partial-vs-nums (result i32 i32)
    (i32.const 1) (block (result i32 i32) (i32.const 2))
  ))
  "type mismatch"
)
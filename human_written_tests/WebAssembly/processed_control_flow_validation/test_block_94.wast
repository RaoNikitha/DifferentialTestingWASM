(assert_invalid
  (module (func $type-break-first-void-vs-nums (result i32 i32)
    (block (result i32 i32) (br 0 (nop)) (br 0 (i32.const 1) (i32.const 2)))
  ))
  "type mismatch"
)
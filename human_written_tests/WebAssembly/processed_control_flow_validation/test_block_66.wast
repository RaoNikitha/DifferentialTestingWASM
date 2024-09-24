(assert_invalid
  (module (func $type-break-last-void-vs-nums (result i32 i32)
    (block (result i32 i32) (br 0))
  ))
  "type mismatch"
)
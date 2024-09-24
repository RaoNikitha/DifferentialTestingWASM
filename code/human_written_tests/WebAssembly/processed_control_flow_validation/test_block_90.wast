(assert_invalid
  (module (func $type-break-first-void-vs-i32 (result i32)
    (block (result i32) (br 0 (nop)) (br 0 (i32.const 1)))
  ))
  "type mismatch"
)
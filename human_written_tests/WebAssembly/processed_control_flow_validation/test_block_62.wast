(assert_invalid
  (module (func $type-break-last-void-vs-i32 (result i32)
    (block (result i32) (br 0))
  ))
  "type mismatch"
)
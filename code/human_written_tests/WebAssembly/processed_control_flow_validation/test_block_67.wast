(assert_invalid
  (module (func $type-break-empty-vs-i32 (result i32)
    (block (result i32) (br 0) (i32.const 1))
  ))
  "type mismatch"
)
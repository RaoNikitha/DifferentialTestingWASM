(assert_invalid
  (module (func $type-break-nested-nums-vs-void
    (block (result i32 i32) (block (result i32 i32) (br 1 (i32.const 1) (i32.const 2))) (br 0))
  ))
  "type mismatch"
)
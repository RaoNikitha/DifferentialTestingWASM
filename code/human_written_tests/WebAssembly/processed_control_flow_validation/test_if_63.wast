(assert_invalid
  (module (func $type-else-break-last-void-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1) (then (i32.const 1) (i32.const 1)) (else (br 0)))
  ))
  "type mismatch"
)
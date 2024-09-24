(assert_invalid
  (module (func $type-both-value-void-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1) (then (nop)) (else (nop)))
  ))
  "type mismatch"
)
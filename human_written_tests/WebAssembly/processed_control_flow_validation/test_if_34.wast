(assert_invalid
  (module (func $type-both-value-empty-vs-nums (result i32 i32)
    (if (result i32 i32) (i32.const 1) (then) (else))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-else-value-void-vs-num (result i32)
    (if (result i32) (i32.const 1) (then (i32.const 0)) (else (nop)))
  ))
  "type mismatch"
)
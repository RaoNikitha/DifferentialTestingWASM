(assert_invalid
  (module (func $type-else-value-nums-vs-void
    (if (i32.const 1) (then) (else (i32.const 1) (i32.const 2)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-then-value-nums-vs-void-else
    (if (i32.const 1) (then (i32.const 1) (i32.const 2)) (else))
  ))
  "type mismatch"
)
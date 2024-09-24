(assert_invalid
  (module (func $type-then-value-num-vs-void-else
    (if (i32.const 1) (then (i32.const 1)) (else))
  ))
  "type mismatch"
)
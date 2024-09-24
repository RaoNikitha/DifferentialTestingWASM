(assert_invalid
  (module (func $type-value-num-vs-void
    (loop (i32.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-nums-vs-void
    (loop (i32.const 1) (i32.const 2))
  ))
  "type mismatch"
)
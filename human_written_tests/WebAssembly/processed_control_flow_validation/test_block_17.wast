(assert_invalid
  (module (func $type-value-i32-vs-void
    (block (i32.const 1))
  ))
  "type mismatch"
)
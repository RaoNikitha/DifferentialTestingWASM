(assert_invalid
  (module (func $type-func-value-num-vs-void-after-return
    (return) (i32.const 1)
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-block-value-num-vs-void-after-return
    (block (return) (i32.const 1))
  ))
  "type mismatch"
)
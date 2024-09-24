(assert_invalid
  (module (func $type-loop-value-num-vs-void-after-return
    (block (loop (return) (i32.const 1)))
  ))
  "type mismatch"
)
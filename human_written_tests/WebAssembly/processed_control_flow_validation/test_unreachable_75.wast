(assert_invalid
  (module (func $type-block-value-num-vs-void-in-dead-body
    (if (i32.const 0) (then (block (i32.const 1))))
  ))
  "type mismatch"
)
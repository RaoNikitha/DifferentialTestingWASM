(assert_invalid
  (module (func $type-if-value-num-vs-void-in-dead-body
    (if (i32.const 0) (then (i32.const 1)))
  ))
  "type mismatch"
)
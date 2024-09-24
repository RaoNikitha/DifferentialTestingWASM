(assert_invalid
  (module (func $type-func-value-num-vs-void-after-unreachable
    (unreachable) (i32.const 1)
  ))
  "type mismatch"
)
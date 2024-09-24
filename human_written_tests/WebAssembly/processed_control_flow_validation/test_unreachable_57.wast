(assert_invalid
  (module (func $type-func-value-num-vs-void-after-nested-unreachable
    (block (unreachable)) (i32.const 1)
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-block-value-num-vs-void-after-nested-unreachable
    (block (block (unreachable)) (i32.const 1))
  ))
  "type mismatch"
)
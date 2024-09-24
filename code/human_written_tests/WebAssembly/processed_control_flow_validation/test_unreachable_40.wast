(assert_invalid
  (module (func $type-block-value-num-vs-void-after-unreachable
    (block (unreachable) (i32.const 1))
  ))
  "type mismatch"
)
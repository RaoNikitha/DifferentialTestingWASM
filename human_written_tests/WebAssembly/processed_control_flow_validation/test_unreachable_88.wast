(assert_invalid
  (module (func $type-block-value-nested-unreachable-num-vs-void
    (block (i32.const 3) (block (unreachable)))
  ))
  "type mismatch"
)
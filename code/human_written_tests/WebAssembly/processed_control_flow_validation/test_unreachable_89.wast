(assert_invalid
  (module (func $type-block-value-nested-unreachable-void-vs-num (result i32)
    (block (block (unreachable)))
  ))
  "type mismatch"
)
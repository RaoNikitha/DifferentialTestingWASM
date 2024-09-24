(assert_invalid
  (module (func $type-loop-value-nested-unreachable-void-vs-num (result i32)
    (loop (block (unreachable)))
  ))
  "type mismatch"
)
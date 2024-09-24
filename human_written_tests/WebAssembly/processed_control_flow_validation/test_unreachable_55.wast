(assert_invalid
  (module (func $type-loop-value-num-vs-void-after-nested-unreachable
    (block (loop (block (unreachable)) (i32.const 1)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-loop-value-num-vs-void-after-unreachable
    (block (loop (unreachable) (i32.const 1)))
  ))
  "type mismatch"
)
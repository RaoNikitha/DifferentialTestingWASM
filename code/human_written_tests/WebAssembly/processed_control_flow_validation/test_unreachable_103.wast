(assert_invalid
  (module (func $type-loop-value-nested-unreachable-num-vs-void
    (loop (i32.const 3) (block (unreachable)))
  ))
  "type mismatch"
)
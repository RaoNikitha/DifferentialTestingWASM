(assert_invalid
  (module (func $type-loop-value-num-vs-void-after-infinite-loop
    (block (loop (loop (br 0)) (i32.const 1)))
  ))
  "type mismatch"
)
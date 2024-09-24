(assert_invalid
  (module (func $type-func-value-num-vs-void-after-infinite-loop
    (loop (br 0)) (i32.const 1)
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-block-value-num-vs-void-after-infinite-loop
    (block (loop (br 0)) (i32.const 1))
  ))
  "type mismatch"
)
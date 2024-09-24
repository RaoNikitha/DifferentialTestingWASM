(assert_invalid
  (module (func $type-loop-value-num-vs-void-after-break
    (block (loop (br 1) (i32.const 1)))
  ))
  "type mismatch"
)
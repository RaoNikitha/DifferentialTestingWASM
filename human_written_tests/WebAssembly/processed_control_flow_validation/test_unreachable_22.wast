(assert_invalid
  (module (func $type-func-value-num-vs-void-after-break
    (br 0) (i32.const 1)
  ))
  "type mismatch"
)
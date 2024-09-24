(assert_invalid
  (module (func $type-param-void-vs-num
    (if (param i32) (i32.const 1) (then (drop)))
  ))
  "type mismatch"
)
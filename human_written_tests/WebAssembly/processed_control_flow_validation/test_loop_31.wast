(assert_invalid
  (module (func $type-param-void-vs-num
    (loop (param i32) (drop))
  ))
  "type mismatch"
)
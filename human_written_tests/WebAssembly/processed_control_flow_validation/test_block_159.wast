(assert_invalid
  (module (func $type-param-void-vs-num
    (block (param i32) (drop))
  ))
  "type mismatch"
)
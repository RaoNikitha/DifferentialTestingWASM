(assert_invalid
  (module (func $type-param-nested-void-vs-num
    (block (block (param i32) (drop)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-nested-void-vs-num
    (block (loop (param i32) (drop)))
  ))
  "type mismatch"
)
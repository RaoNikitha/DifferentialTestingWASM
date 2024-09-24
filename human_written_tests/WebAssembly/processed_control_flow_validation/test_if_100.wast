(assert_invalid
  (module (func $type-param-nested-void-vs-num
    (block (if (param i32) (i32.const 1) (then (drop))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-param-void-vs-nums
    (block (if (param i32 f64) (i32.const 1) (then (drop) (drop))))
  ))
  "type mismatch"
)
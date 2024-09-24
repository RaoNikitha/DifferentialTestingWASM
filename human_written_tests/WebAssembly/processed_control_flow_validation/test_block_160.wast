(assert_invalid
  (module (func $type-param-void-vs-nums
    (block (param i32 f64) (drop) (drop))
  ))
  "type mismatch"
)
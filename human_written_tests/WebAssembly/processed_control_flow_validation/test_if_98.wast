(assert_invalid
  (module (func $type-param-num-vs-num
    (f32.const 0) (if (param i32) (i32.const 1) (then (drop)))
  ))
  "type mismatch"
)
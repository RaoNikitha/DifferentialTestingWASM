(assert_invalid
  (module (func $type-param-num-vs-num
    (f32.const 0) (loop (param i32) (drop))
  ))
  "type mismatch"
)
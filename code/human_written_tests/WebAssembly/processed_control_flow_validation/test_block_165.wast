(assert_invalid
  (module (func $type-param-num-vs-num
    (block (f32.const 0) (block (param i32) (drop)))
  ))
  "type mismatch"
)
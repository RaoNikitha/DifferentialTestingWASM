(assert_invalid
  (module (func $type-param-num-vs-nums
    (block (f32.const 0) (if (param f32 i32) (i32.const 1) (then (drop) (drop))))
  ))
  "type mismatch"
)
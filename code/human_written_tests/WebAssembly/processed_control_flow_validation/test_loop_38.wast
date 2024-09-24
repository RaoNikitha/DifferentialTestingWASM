(assert_invalid
  (module (func $type-param-num-vs-nums
    (block (f32.const 0) (loop (param f32 i32) (drop) (drop)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-loop-value-num-vs-num-after-return (result i32)
    (loop (result i32) (return (i32.const 1)) (f32.const 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-loop-value-num-vs-num-after-infinite-loop (result i32)
    (loop (result i32) (loop (br 0)) (f32.const 0))
  ))
  "type mismatch"
)
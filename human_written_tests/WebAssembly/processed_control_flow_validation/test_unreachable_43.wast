(assert_invalid
  (module (func $type-loop-value-num-vs-num-after-unreachable (result i32)
    (loop (result i32) (unreachable) (f32.const 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-loop-value-num-vs-num-after-break (result i32)
    (loop (result i32) (br 1 (i32.const 1)) (f32.const 0))
  ))
  "type mismatch"
)
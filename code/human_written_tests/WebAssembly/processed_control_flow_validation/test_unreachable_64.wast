(assert_invalid
  (module (func $type-block-value-num-vs-num-after-infinite-loop (result i32)
    (block (result i32) (i32.const 1) (loop (br 0)) (f32.const 0))
  ))
  "type mismatch"
)
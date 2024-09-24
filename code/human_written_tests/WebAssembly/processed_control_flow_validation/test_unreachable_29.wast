(assert_invalid
  (module (func $type-block-value-num-vs-num-after-return (result i32)
    (block (result i32) (i32.const 1) (return (i32.const 0)) (f32.const 0))
  ))
  "type mismatch"
)
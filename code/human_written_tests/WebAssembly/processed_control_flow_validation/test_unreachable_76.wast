(assert_invalid
  (module (func $type-block-value-num-vs-num-in-dead-body (result i32)
    (if (result i32) (i32.const 0) (then (block (result i32) (f32.const 0))))
  ))
  "type mismatch"
)
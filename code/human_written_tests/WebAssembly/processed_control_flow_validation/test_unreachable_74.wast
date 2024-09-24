(assert_invalid
  (module (func $type-if-value-num-vs-num-in-dead-body (result i32)
    (if (result i32) (i32.const 0) (then (f32.const 0)))
  ))
  "type mismatch"
)
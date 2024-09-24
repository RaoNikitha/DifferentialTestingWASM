(assert_invalid
  (module (func $type-func-value-num-vs-num-after-unreachable (result i32)
    (unreachable) (f32.const 0)
  ))
  "type mismatch"
)
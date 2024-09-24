(assert_invalid
  (module (func $type-func-value-num-vs-num-after-nested-unreachable
    (result i32)
    (block (unreachable)) (f32.const 0)
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-block-value-num-vs-num-after-nested-unreachable
    (result i32)
    (block (result i32) (i32.const 1) (block (unreachable)) (f32.const 0))
  ))
  "type mismatch"
)
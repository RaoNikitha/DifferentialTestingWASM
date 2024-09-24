(assert_invalid
  (module (func $type-block-value-num-vs-num-after-break (result i32)
    (block (result i32) (i32.const 1) (br 0) (f32.const 0))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-binary-num-vs-void-after-return
    (return) (block (drop (f32.eq (i32.const 1))))
  ))
  "type mismatch"
)
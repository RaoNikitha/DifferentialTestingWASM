(assert_invalid
  (module (func $type-binary-num-vs-void-in-dead-body
    (if (i32.const 0) (then (drop (f32.eq (i32.const 1)))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-binary-num-vs-num-in-dead-body
    (if (i32.const 0) (then (drop (f32.eq (i32.const 1) (f32.const 0)))))
  ))
  "type mismatch"
)
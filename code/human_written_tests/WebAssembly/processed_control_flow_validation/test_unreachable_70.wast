(assert_invalid
  (module (func $type-unary-num-vs-num-in-dead-body
    (if (i32.const 0) (then (drop (i32.eqz (f32.const 1)))))
  ))
  "type mismatch"
)
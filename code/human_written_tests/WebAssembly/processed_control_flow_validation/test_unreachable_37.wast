(assert_invalid
  (module (func $type-unary-num-vs-num-after-unreachable
    (unreachable) (drop (i32.eqz (f32.const 1)))
  ))
  "type mismatch"
)
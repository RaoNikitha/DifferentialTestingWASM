(assert_invalid
  (module (func $type-unary-num-vs-num-after-infinite-loop
    (loop (br 0)) (drop (i32.eqz (f32.const 1)))
  ))
  "type mismatch"
)
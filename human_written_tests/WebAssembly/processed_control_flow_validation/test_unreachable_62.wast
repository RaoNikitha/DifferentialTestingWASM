(assert_invalid
  (module (func $type-binary-num-vs-num-after-infinite-loop
    (loop (br 0)) (drop (f32.eq (i32.const 1) (f32.const 0)))
  ))
  "type mismatch"
)
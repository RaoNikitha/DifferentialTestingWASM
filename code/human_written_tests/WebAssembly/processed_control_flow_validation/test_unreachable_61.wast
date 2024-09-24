(assert_invalid
  (module (func $type-binary-num-vs-void-after-infinite-loop
    (loop (br 0)) (block (drop (f32.eq (i32.const 1))))
  ))
  "type mismatch"
)
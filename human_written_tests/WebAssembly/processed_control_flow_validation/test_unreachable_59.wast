(assert_invalid
  (module (func $type-unary-num-vs-void-after-infinite-loop
    (loop (br 0)) (block (drop (i32.eqz (nop))))
  ))
  "type mismatch"
)
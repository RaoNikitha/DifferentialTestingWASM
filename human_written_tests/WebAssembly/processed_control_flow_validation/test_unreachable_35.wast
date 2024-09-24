(assert_invalid
  (module (func $type-unary-num-vs-void-in-loop-after-unreachable
    (unreachable) (loop (drop (i32.eqz (nop))))
  ))
  "type mismatch"
)
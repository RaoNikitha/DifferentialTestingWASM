(assert_invalid
  (module (func $type-unary-num-vs-void-after-unreachable
    (unreachable) (block (drop (i32.eqz (nop))))
  ))
  "type mismatch"
)
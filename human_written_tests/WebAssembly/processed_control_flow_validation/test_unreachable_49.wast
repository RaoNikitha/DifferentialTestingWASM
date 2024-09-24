(assert_invalid
  (module (func $type-unary-num-vs-void-after-nested-unreachable
    (block (unreachable)) (block (drop (i32.eqz (nop))))
  ))
  "type mismatch"
)
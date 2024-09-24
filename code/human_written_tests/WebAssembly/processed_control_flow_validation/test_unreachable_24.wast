(assert_invalid
  (module (func $type-unary-num-vs-void-after-return
    (return) (block (drop (i32.eqz (nop))))
  ))
  "type mismatch"
)
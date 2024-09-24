(assert_invalid
  (module (func $type-unary-num-vs-void-in-dead-body
    (if (i32.const 0) (then (drop (i32.eqz (nop)))))
  ))
  "type mismatch"
)
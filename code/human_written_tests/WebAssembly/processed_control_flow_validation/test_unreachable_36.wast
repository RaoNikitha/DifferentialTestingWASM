(assert_invalid
  (module (func $type-unary-num-vs-void-in-i32-loop-after-unreachable
    (unreachable) (loop (result i32) (i32.eqz (nop)))
  ))
  "type mismatch"
)
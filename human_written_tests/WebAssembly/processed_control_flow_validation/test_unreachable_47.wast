(assert_invalid
  (module (func $type-unary-num-vs-void-in-else-after-unreachable
    (unreachable) (if (i32.const 0) (then (nop)) (else (drop (i32.eqz (nop)))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-unary-num-vs-void-in-else-after-unreachable-if
    (if (i32.const 0) (then (unreachable)) (else (drop (i32.eqz (nop)))))
  ))
  "type mismatch"
)
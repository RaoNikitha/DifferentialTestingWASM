(assert_invalid
  (module (func $type-unary-num-vs-void-after-break
    (block (br 0) (block (drop (i32.eqz (nop)))))
  ))
  "type mismatch"
)
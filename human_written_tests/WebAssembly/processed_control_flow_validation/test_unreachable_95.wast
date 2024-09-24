(assert_invalid
  (module (func $type-block-value-nested2-br-num-vs-void
    (block (block (i32.const 3) (block (br 2))))
  ))
  "type mismatch"
)
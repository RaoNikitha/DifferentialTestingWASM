(assert_invalid
  (module (func $type-block-value-nested-br-num-vs-void
    (block (i32.const 3) (block (br 1)))
  ))
  "type mismatch"
)
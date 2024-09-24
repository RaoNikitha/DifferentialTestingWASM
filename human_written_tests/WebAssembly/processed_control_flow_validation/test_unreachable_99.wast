(assert_invalid
  (module (func $type-block-value-nested-return-num-vs-void
    (block (i32.const 3) (block (return)))
  ))
  "type mismatch"
)
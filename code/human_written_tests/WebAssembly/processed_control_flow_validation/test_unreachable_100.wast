(assert_invalid
  (module (func $type-block-value-nested-return-void-vs-num (result i32)
    (block (block (return (i32.const 0))))
  ))
  "type mismatch"
)
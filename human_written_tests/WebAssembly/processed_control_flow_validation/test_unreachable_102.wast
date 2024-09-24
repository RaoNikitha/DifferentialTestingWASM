(assert_invalid
  (module (func $type-block-value-nested-return-num2-vs-void (result i32)
    (block (i32.const 3) (block (i64.const 1) (return (i32.const 0))))
    (i32.const 9)
  ))
  "type mismatch"
)
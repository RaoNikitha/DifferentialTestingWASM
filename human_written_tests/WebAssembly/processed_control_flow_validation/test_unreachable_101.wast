(assert_invalid
  (module (func $type-block-value-nested-return-num-vs-num (result i32)
    (block (result i64) (i64.const 0) (block (return (i32.const 0))))
  ))
  "type mismatch"
)
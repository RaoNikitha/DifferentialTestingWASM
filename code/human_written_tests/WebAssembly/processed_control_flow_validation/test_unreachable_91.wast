(assert_invalid
  (module (func $type-block-value-nested-unreachable-num2-vs-void (result i32)
    (block (i32.const 3) (block (i64.const 1) (unreachable))) (i32.const 9)
  ))
  "type mismatch"
)
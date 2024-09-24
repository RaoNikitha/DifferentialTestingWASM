(assert_invalid
  (module (func $type-block-value-nested-unreachable-num-vs-num (result i32)
    (block (result i64) (i64.const 0) (block (unreachable)))
  ))
  "type mismatch"
)
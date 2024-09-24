(assert_invalid
  (module (func $type-loop-value-nested-unreachable-num-vs-num (result i32)
    (loop (result i64) (i64.const 0) (block (unreachable)))
  ))
  "type mismatch"
)
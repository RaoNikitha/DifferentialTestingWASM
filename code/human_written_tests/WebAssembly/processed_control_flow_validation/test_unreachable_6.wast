(assert_invalid
  (module (func $type-poly-num-vs-num (result i32)
    (unreachable) (i64.const 0) (i32.const 0) (select)
  ))
  "type mismatch"
)
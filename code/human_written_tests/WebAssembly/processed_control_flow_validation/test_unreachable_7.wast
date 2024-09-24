(assert_invalid
  (module (func $type-poly-transitive-num-vs-num (result i32)
    (unreachable)
    (i64.const 0) (i32.const 0) (select)
    (i32.const 0) (i32.const 0) (select)
  ))
  "type mismatch"
)
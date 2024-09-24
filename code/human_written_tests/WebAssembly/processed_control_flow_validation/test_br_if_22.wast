(assert_invalid
  (module (func $type-arg-cond-num-vs-i32 (result i32)
    (block (result i32) (br_if 0 (i32.const 0) (i64.const 0)) (i32.const 1))
  ))
  "type mismatch"
)
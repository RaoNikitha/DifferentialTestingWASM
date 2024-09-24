(assert_invalid
  (module (func $type-cond-num-vs-i32
    (block (br_if 0 (i64.const 0)))
  ))
  "type mismatch"
)
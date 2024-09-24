(assert_invalid
  (module (func $type-index-num-vs-i32
    (block (br_table 0 (i64.const 0)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-arg-index-num-vs-i32 (result i32)
    (block (result i32)
      (br_table 0 0 (i32.const 0) (i64.const 0)) (i32.const 1)
    )
  ))
  "type mismatch"
)
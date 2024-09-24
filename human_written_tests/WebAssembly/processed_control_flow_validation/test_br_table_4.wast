(assert_invalid
  (module (func $type-arg-num-vs-num (result i32)
    (block (result i32)
      (br_table 0 0 0 (i64.const 1) (i32.const 1)) (i32.const 1)
    )
  ))
  "type mismatch"
)
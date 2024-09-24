(assert_invalid
  (module (func
    (block (result i32)
      (block (result i64)
        (br_table 0 1 (i32.const 0) (i32.const 0))
      )
    )
  ))
  "type mismatch"
)
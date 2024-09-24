(assert_invalid
  (module
    (func $type-condition-empty-in-br_table
      (i32.const 0)
      (block (br_table 0 (if(then))) (drop))
    )
  )
  "type mismatch"
)
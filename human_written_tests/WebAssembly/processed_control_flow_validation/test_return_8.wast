(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-br_table (result i32)
      (i32.const 0)
      (block (br_table 0 (return)))
    )
  )
  "type mismatch"
)
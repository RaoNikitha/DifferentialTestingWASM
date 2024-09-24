(assert_invalid
  (module (func $type-arg-empty-vs-num (result i32)
    (block (br_table 0) (i32.const 1))
  ))
  "type mismatch"
)
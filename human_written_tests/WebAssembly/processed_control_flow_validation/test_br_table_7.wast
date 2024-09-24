(assert_invalid
  (module (func $type-index-void-vs-i32
    (block (br_table 0 0 0 (nop)))
  ))
  "type mismatch"
)
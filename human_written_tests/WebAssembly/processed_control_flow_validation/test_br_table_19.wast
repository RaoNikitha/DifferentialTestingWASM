(assert_invalid
  (module (func $unbound-label
    (block (br_table 2 1 (i32.const 1)))
  ))
  "unknown label"
)
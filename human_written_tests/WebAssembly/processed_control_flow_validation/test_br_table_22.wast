(assert_invalid
  (module (func $unbound-label-default
    (block (br_table 1 2 (i32.const 1)))
  ))
  "unknown label"
)
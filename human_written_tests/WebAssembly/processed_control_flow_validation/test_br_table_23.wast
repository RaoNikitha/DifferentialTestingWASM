(assert_invalid
  (module (func $unbound-nested-label-default
    (block (block (br_table 0 5 (i32.const 1))))
  ))
  "unknown label"
)
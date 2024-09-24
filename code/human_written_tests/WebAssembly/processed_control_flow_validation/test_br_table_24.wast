(assert_invalid
  (module (func $large-label-default
    (block (br_table 0 0 0x10000001 (i32.const 1)))
  ))
  "unknown label"
)
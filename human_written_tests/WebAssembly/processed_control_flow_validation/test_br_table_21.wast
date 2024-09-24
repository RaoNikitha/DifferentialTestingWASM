(assert_invalid
  (module (func $large-label
    (block (br_table 0 0x10000001 0 (i32.const 1)))
  ))
  "unknown label"
)
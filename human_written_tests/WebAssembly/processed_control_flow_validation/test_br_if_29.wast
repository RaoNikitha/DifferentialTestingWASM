(assert_invalid
  (module (func $large-label (br_if 0x10000001 (i32.const 1))))
  "unknown label"
)
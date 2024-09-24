(assert_invalid
  (module (func $unbound-label (br_if 1 (i32.const 1))))
  "unknown label"
)
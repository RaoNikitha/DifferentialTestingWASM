(assert_invalid
  (module (func $unbound-nested-label (block (block (br_if 5 (i32.const 1))))))
  "unknown label"
)
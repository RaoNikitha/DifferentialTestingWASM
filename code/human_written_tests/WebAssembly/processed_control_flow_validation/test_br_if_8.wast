(assert_invalid
  (module (func $type-true-f64 (block (f64.neg (br_if 0 (i64.const 1))))))
  "type mismatch"
)
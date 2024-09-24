(assert_invalid
  (module (func $type-true-i64 (block (i64.ctz (br_if 0 (i64.const 1))))))
  "type mismatch"
)
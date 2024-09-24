(assert_invalid
  (module (func $type-false-i64 (block (i64.ctz (br_if 0 (i32.const 0))))))
  "type mismatch"
)
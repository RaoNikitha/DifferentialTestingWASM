(assert_invalid
  (module (func $type-true-i32 (block (i32.ctz (br_if 0 (i32.const 1))))))
  "type mismatch"
)
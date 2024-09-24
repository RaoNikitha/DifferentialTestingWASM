(assert_invalid
  (module (func $type-true-f32 (block (f32.neg (br_if 0 (f32.const 1))))))
  "type mismatch"
)
(assert_invalid
  (module (func $type-true-arg-void-vs-num (result i32)
    (block (result i32) (br_if 0 (nop) (i32.const 1)) (i32.const 1))
  ))
  "type mismatch"
)
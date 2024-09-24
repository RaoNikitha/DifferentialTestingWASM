(assert_invalid
  (module (func $type-arg-void-vs-num-nested (result i32)
    (block (result i32) (i32.const 0) (block (br_table 1 (i32.const 0))))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-arg-void-vs-num-nested (result i32)
    (block (result i32) (i32.const 0) (block (br 1)))
  ))
  "type mismatch"
)
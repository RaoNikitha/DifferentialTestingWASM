(assert_invalid
  (module (func $type-arg-void-vs-num (result i32)
    (block (result i32) (br 0 (nop)) (i32.const 1))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-block-value-nested-br-void-vs-num (result i32)
    (block (result i32) (block (br 1 (i32.const 0))))
  ))
  "type mismatch"
)
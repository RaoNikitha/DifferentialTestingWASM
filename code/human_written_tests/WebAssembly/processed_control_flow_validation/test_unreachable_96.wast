(assert_invalid
  (module (func $type-block-value-nested2-br-void-vs-num (result i32)
    (block (result i32) (block (block (br 2 (i32.const 0)))))
  ))
  "type mismatch"
)
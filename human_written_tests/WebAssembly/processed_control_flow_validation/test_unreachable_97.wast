(assert_invalid
  (module (func $type-block-value-nested2-br-num-vs-num (result i32)
    (block (result i32)
      (block (result i64) (i64.const 0) (block (br 2 (i32.const 0))))
    )
  ))
  "type mismatch"
)
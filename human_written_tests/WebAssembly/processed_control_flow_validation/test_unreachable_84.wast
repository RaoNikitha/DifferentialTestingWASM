(assert_invalid
  (module (func $type-br_if-num2-vs-num-after-unreachable (result i32)
    (block (result i32)
      (unreachable) (br_if 0 (i32.const 0) (i32.const 0)) (i32.const 0)
    )
  ))
  "type mismatch"
)
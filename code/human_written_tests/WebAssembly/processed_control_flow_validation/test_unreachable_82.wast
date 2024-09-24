(assert_invalid
  (module (func $type-br_if-num-vs-void-after-unreachable (result i32)
    (block (result i32)
      (block (unreachable) (br_if 1 (i32.const 0) (i32.const 0)))
    )
  ))
  "type mismatch"
)
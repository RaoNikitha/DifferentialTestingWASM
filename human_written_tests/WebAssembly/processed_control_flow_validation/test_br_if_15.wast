(assert_invalid
  (module (func $type-false-arg-num-vs-num (result i32)
    (block (result i32)
      (drop (br_if 0 (i64.const 1) (i32.const 0))) (i32.const 1)
    )
  ))
  "type mismatch"
)
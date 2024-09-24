(assert_invalid
  (module (func $type-value-nums-vs-num (result i32)
    (loop (result i32) (i32.const 1) (i32.const 2))
  ))
  "type mismatch"
)
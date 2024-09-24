(assert_invalid
  (module (func $type-no-else-vs-num (result i32)
    (if (result i32) (i32.const 1) (then (i32.const 1)))
  ))
  "type mismatch"
)
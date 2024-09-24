(assert_invalid
  (module (func $type-value-empty-vs-num (result i32)
    (loop (result i32))
  ))
  "type mismatch"
)
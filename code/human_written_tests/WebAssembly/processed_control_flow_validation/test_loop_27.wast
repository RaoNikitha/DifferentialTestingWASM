(assert_invalid
  (module (func $type-value-unreached-select (result i32)
    (loop (result i64) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)
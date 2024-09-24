(assert_invalid
  (module (func $type-value-unreached-select-i32-i64 (result i32)
    (block (result i64) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-unreached-select-i64-f64 (result i64)
    (block (result f64) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)
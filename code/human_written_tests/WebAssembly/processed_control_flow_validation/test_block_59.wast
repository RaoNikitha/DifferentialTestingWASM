(assert_invalid
  (module (func $type-value-unreached-select-f64-i32 (result f64)
    (block (result i32) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-value-unreached-select-i64-f32 (result i64)
    (block (result f32) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)
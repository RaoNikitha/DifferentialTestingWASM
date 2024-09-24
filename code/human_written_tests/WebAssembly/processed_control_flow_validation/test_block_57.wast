(assert_invalid
  (module (func $type-value-unreached-select-f32-i64 (result f32)
    (block (result i64) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)
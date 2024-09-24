(assert_invalid
  (module (func $type-value-unreached-select-i32-f32 (result i32)
    (block (result f32) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)
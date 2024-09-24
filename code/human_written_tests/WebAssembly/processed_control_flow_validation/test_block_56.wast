(assert_invalid
  (module (func $type-value-unreached-select-f32-i32 (result f32)
    (block (result i32) (select (unreachable) (unreachable) (unreachable)))
  ))
  "type mismatch"
)
(assert_invalid 
  (module
    (func $type-br_if-after-unreachable (result i64)
      unreachable
      br_if 0
      i64.extend_i32_u
    )
  )
 "type mismatch"
)
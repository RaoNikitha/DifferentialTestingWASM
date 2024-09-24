(assert_invalid
  (module (func $type-unconsumed-result2
    (unreachable) (i32.const 0) (i32.add)
  ))
  "type mismatch"
)
(assert_invalid
  (module (func $type-unconsumed-poly2
    (unreachable) (i32.const 0) (i32.const 0) (select)
  ))
  "type mismatch"
)
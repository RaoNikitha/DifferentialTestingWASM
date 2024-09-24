(assert_invalid
  (module (func $type-unconsumed-poly1 (unreachable) (i32.const 0) (select)))
  "type mismatch"
)
(assert_invalid
  (module (func $type-unconsumed-poly0 (unreachable) (select)))
  "type mismatch"
)
(assert_invalid
  (module (func $type-unconsumed-result (unreachable) (i32.eqz)))
  "type mismatch"
)
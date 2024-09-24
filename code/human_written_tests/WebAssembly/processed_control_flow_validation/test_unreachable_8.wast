(assert_invalid
  (module (func $type-unconsumed-const (unreachable) (i32.const 0)))
  "type mismatch"
)
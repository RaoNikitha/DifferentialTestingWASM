(assert_invalid
  (module (func (unreachable) (select (i64.const 1)) (drop)))
  "type mismatch"
)
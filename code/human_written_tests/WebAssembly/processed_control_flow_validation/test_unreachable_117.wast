(assert_invalid
  (module (func (unreachable) (select)))
  "type mismatch"
)
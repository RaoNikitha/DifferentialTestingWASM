(assert_invalid
  (module (func $unbound-func (call 1)))
  "unknown function"
)
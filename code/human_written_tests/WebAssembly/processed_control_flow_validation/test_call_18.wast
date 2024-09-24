(assert_invalid
  (module (func $large-func (call 1012321300)))
  "unknown function"
)
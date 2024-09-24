(assert_invalid
  (module (func $func-index (unreachable) (call 1)))
  "unknown function"
)
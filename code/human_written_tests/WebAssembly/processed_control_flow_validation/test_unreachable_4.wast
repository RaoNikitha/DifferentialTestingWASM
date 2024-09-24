(assert_invalid
  (module (func $label-index (unreachable) (br 1)))
  "unknown label"
)
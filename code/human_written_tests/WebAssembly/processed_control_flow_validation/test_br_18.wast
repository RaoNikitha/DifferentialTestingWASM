(assert_invalid
  (module (func $unbound-label (br 1)))
  "unknown label"
)
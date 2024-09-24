(assert_invalid
  (module (func $large-label (br 0x10000001)))
  "unknown label"
)
(assert_invalid
  (module (func $unbound-nested-label (block (block (br 5)))))
  "unknown label"
)
(assert_malformed
  (module quote "(func i32.const 0 if end $l)")
  "mismatching label"
)
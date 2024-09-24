(assert_malformed
  (module quote "(func loop end $l)")
  "mismatching label"
)
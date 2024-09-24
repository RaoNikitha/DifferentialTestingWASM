(assert_malformed
  (module quote "(func block end $l)")
  "mismatching label"
)
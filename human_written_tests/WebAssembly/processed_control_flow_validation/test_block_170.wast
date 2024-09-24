(assert_malformed
  (module quote "(func block $a end $l)")
  "mismatching label"
)
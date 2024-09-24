(assert_malformed
  (module quote "(func loop $a end $l)")
  "mismatching label"
)
(assert_malformed
  (module quote "(func i32.const 0 if $a end $l)")
  "mismatching label"
)
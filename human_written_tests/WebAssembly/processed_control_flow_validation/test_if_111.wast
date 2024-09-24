(assert_malformed
  (module quote "(func i32.const 0 if else $l end $l)")
  "mismatching label"
)
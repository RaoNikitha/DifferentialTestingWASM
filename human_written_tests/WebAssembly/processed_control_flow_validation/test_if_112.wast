(assert_malformed
  (module quote "(func i32.const 0 if else $l1 end $l2)")
  "mismatching label"
)
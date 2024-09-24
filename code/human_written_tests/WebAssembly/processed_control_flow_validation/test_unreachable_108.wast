(assert_invalid
  (module (func $tee-local-unreachable-value
    (local i32)
    (local.tee 0 (unreachable))
  ))
  "type mismatch"
)
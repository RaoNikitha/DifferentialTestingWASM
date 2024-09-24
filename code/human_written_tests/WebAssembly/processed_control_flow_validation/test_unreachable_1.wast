(assert_invalid
  (module (func $local-index (unreachable) (drop (local.get 0))))
  "unknown local"
)
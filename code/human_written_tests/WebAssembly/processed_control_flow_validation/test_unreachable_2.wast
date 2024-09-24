(assert_invalid
  (module (func $global-index (unreachable) (drop (global.get 0))))
  "unknown global"
)
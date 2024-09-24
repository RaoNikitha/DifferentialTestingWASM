(assert_invalid
  (module (func $type-num-vs-num
    (unreachable) (drop (i64.eqz (i32.const 0))))
  )
  "type mismatch"
)
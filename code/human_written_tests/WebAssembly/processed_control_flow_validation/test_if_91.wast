(assert_invalid
  (module
    (func $type-condition-empty-in-local.tee
      (local i32)
      (local.tee 0 (if(then))) (drop)
    )
  )
  "type mismatch"
)
(assert_invalid
  (module
    (func $type-condition-empty-in-local.set
      (local i32)
      (local.set 0 (if(then))) (local.get 0) (drop)
    )
  )
  "type mismatch"
)
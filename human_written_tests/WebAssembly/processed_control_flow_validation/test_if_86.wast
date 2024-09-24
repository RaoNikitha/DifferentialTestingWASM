(assert_invalid
  (module
    (func $type-condition-empty-in-return
      (return (if(then))) (drop)
    )
  )
  "type mismatch"
)
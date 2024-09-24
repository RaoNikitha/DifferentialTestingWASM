(assert_invalid
  (module
    (memory 0)
    (func $type-condition-empty-in-load
      (i32.load (if(then))) (drop)
    )
  )
  "type mismatch"
)